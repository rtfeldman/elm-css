//@flow

const _ = require("lodash"),
  path = require("path"),
  firstline = require("firstline"),
  installReadElmi = require("../installer"),
  finder = require("./read-exposed.js"),
  fs = require("fs-extra"),
  spawn = require("cross-spawn");

function findExposedValues(
  types /*: Array<string>*/,
  readElmiPath /*: string*/,
  elmPackageJsonPath /*: string*/,
  elmFilePaths /*: Array<string>*/,
  sourceDirs /*: Array<string>*/,
  verbose /*: boolean*/
) {
  return new Promise(function(resolve, reject) {
    function finish() {
      var process = spawn(readElmiPath, ["--path", elmPackageJsonPath]);
      var jsonStr = "";
      var stderrStr = "";

      process.stdout.on("data", function(data) {
        jsonStr += data;
      });

      process.stderr.on("data", function(data) {
        stderrStr += data;
      });

      process.on("close", function(code) {
        if (stderrStr !== "") {
          reject(stderrStr);
        } else if (code !== 0) {
          reject("Finding test interfaces failed, exiting with code " + code);
        }

        var modules;

        try {
          modules = JSON.parse(jsonStr);
        } catch (err) {
          reject("Received invalid JSON from test interface search: " + err);
        }

        var filteredModules = _.flatMap(modules, function(mod) {
          var eligible = _.flatMap(mod.types, function(typ) {
            if (types.indexOf(typ.signature) === -1) {
              return [];
            } else {
              return { name: typ.name, signature: typ.signature };
            }
          });

          // Must have at least 1 relevant exposed value. Otherwise ignore this module.
          if (eligible.length > 0) {
            return [{ name: mod.moduleName, values: eligible }];
          } else {
            return [];
          }
        });

        return verifyModules(elmFilePaths)
          .then(function() {
            return Promise.all(
              _.map(
                _.flatMap(
                  filteredModules,
                  toPathsAndModules(elmFilePaths, sourceDirs)
                ),
                filterExposing
              )
            )
              .then(resolve)
              .catch(reject);
          })
          .catch(reject);
      });
    }

    if (fs.existsSync(readElmiPath)) {
      // elm-interface-to-json was already downloaded successfully. We're good!
      return finish();
    } else {
      // it wasn't downloaded, possibly because we were installed with
      // --ignore-scripts - so download it!
      return installReadElmi(verbose)
        .then(finish)
        .catch(reject);
    }
  });
}

function moduleFromFilePath(filePathArg) {
  var parsed = path.parse(path.normalize(filePathArg));
  var basename = path.basename(parsed.base, ".elm");

  // Turn these into module name checks to be performed, in order.
  // e.g. 'tests/All/Passing.elm' ===> ['Passing', 'All', 'tests']
  // This way, if we're given 'All.Passing' as a module name, we can also
  // flip it into ['Passing', 'All'], and see if the first N elements line up.
  return _.compact(parsed.dir.split(path.sep).concat([basename])).reverse();
}

function moduleFromTestName(testName) {
  return testName.split(".").reverse();
}

function toPathsAndModules(
  elmFilePaths /*:Array<string>*/,
  sourceDirs /*:Array<string>*/
) {
  var paths = elmFilePaths.map(function(filePath) {
    return { filePath: filePath, module: moduleFromFilePath(filePath) };
  });

  // Each module must correspond to a file path, by way of a source directory.
  // This filters out stale modules left over from previous builds, for example
  // what happened in https://github.com/rtfeldman/node-test-runner/issues/122
  return function(testModule) {
    var moduleAsFilename = testModule.name.replace(/[\.]/g, path.sep) + ".elm";

    // for early return purposes, use old-school `for` loops
    for (var pathIndex = 0; pathIndex < paths.length; pathIndex++) {
      var currentPath = paths[pathIndex];

      for (
        var testSourceDirIndex = 0;
        testSourceDirIndex < sourceDirs.length;
        testSourceDirIndex++
      ) {
        var testSourceDir = sourceDirs[testSourceDirIndex];

        if (
          currentPath.filePath === path.join(testSourceDir, moduleAsFilename)
        ) {
          return [
            {
              name: testModule.name,
              values: testModule.values,
              path: currentPath.filePath
            }
          ];
        }
      }
    }

    return [];
  };
}

// Check for modules where the name doesn't match the filename.
// elm-make won't get a chance to detect this; they'll be filtered out first.
function verifyModules(filePaths) {
  return Promise.all(
    _.map(filePaths, function(filePath) {
      return firstline(filePath).then(function(line) {
        var matches = line.match(/^(?:(?:port|effect)\s+)?module\s+(\S+)\s*/);

        if (matches) {
          var moduleName = matches[1];
          var testModulePaths = moduleFromTestName(moduleName);
          var modulePath = moduleFromFilePath(filePath);

          // A module path matches if it lines up completely with a known one.
          if (
            !testModulePaths.every(function(testModulePath, index) {
              return testModulePath === modulePath[index];
            })
          ) {
            return Promise.reject(
              filePath +
                ' has a module declaration of "' +
                moduleName +
                '" - which does not match its filename!'
            );
          }
        } else {
          return Promise.reject(
            filePath +
              " has an invalid module declaration. Check the first line of the file and make sure it has a valid module declaration there!"
          );
        }
      });
    })
  );
}

function filterExposing(pathAndModule) {
  return new Promise(function(resolve, reject) {
    return finder
      .readExposing(pathAndModule.path)
      .then(function(exposedValues) {
        const values = pathAndModule.values;
        const newValues =
          exposedValues.length === 1 && exposedValues[0] === ".."
            ? // null exposedValues means "the module was exposing (..), so keep everything"
              values
            : // Only keep the values that were exposed.
              _.intersectionWith(values, exposedValues, function(
                value,
                exposedName
              ) {
                return exposedName === value.name;
              });

        if (newValues.length < pathAndModule.values.length) {
          // TODO make this more generic
          return reject(
            "\n`" +
              pathAndModule.name +
              "` is a module with top-level Test values which it does not expose:\n\n" +
              _.difference(pathAndModule.values, newValues)
                .map(function(test) {
                  return test + " : Test";
                })
                .join("\n") +
              "\n\nThese tests will not get run. Please either expose them or move them out of the top level."
          );
        } else {
          return resolve({ name: pathAndModule.name, values: newValues });
        }
      })
      .catch(reject);
  });
}

module.exports = {
  findExposedValues: findExposedValues
};
