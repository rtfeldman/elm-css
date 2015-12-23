var fs = require("fs");
var tmp = require("tmp");
var path = require("path");
var compile = require("node-elm-compiler").compile;
var jsEmitterFilename = "emitter.js";

// elmModuleName is optional, and is by default inferred based on the filename.
module.exports = function(projectDir, stylesheetsPath, outputDir, stylesheetsModule, stylesheetsPort) {
  return new Promise(function(resolve, reject) {
    var originalWorkingDir = process.cwd();

    tmp.dir(function (err, tmpDirPath) {
      if (err) {
        return reject(err);
      }

      process.chdir(projectDir);

      return generateCssFiles(
          stylesheetsPath,
          path.join(tmpDirPath, jsEmitterFilename),
          outputDir,
          stylesheetsModule || "Stylesheets",
          stylesheetsPort || "files"
        )
        .then(function(result) {
          process.chdir(originalWorkingDir);
          resolve(result);
        }, function(err) {
          process.chdir(originalWorkingDir);
          reject(result);
        });
    });
  });
}

function generateCssFiles(stylesheetsPath, emitterDest, outputDir, stylesheetsModule, stylesheetsPort) {
  return new Promise(function(resolve, reject) {
    return emit(stylesheetsPath, emitterDest, stylesheetsModule, stylesheetsPort)
      .then(writeResults(outputDir), reject).then(resolve, reject);
    });
}

function emit(src, dest, stylesheetsModule, stylesheetsPort) {
  return new Promise(function(resolve, reject) {
    // Compile the temporary file.
    compileEmitter(src, {output: dest, yes: true}).then(function() {
      // Make the compiled emitter.js Node-friendly.
      fs.appendFile(dest, "\nmodule.exports = Elm;", function(err) {
        if (err) {
          return reject(err);
        }

        var Elm = require(dest);
        var stylesheets = Elm.worker(Elm[stylesheetsModule]).ports[stylesheetsPort];
        var failures = stylesheets.filter(function(result) {
          return !result.success;
        });

        return failures.length > 0
          ? reject(reportFailures(failures))
          : resolve(stylesheets);
      });
    }, reject);
  });
}

function writeResults(outputDir) {
  return function(results) {
    return Promise.all(
      results.map(function(result) {
        return new Promise(function(resolve, reject) {
          fs.writeFile(path.join(outputDir, result.filename), result.content + "\n", function(err, file) {
            return err ? reject(err) : resolve(file);
          });
        })
      })
    );
  };
}

function reportFailures(failures) {
  return "The following errors occurred during compilation:\n\n" +
    failures.map(function(result) {
      return result.filename + ": " + result.content;
    }).join("\n\n");
}

function compileEmitter(src, options) {
  return new Promise(function(resolve, reject) {
    compile(src, options)
      .on("close", function(exitCode) {
        if (exitCode === 0) {
          resolve();
        } else {
          reject("Errored with exit code " + exitCode);
        }
      });
  });
}
