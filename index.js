//@flow

const _ = require("lodash"),
  path = require("path"),
  glob = require("glob"),
  mkdirp = require("mkdirp"),
  findExposedValues = require("./js/find-exposed-values").findExposedValues,
  writeMain = require("./js/generate-main").writeMain,
  writeFile = require("./js/generate-class-modules").writeFile,
  fs = require("fs-extra"),
  compile = require("node-elm-compiler").compile,
  extractCssResults = require("./js/extract-css-results.js"),
  hackMain = require("./js/hack-main.js");

const binaryExtension = process.platform === "win32" ? ".exe" : "";
const readElmiPath =
  path.join(__dirname, "bin", "elm-interface-to-json") + binaryExtension;
const jsEmitterFilename = "emitter.js";

module.exports = function(
  projectDir /*: string*/,
  outputDir /*: string */,
  pathToMake /*: ?string */
) {
  const cssSourceDir = path.join(projectDir, "css");
  const originalWorkingDir = process.cwd();

  function resetWorkingDir(error) {
    process.chdir(originalWorkingDir);
    return Promise.reject(error);
  }

  process.chdir(projectDir);

  // TODO use resolveFilePath from node-test-runner instead
  const elmFilePaths = glob.sync("/**/*.elm", {
    root: cssSourceDir,
    nocase: true,
    ignore: "/**/elm-stuff/**",
    nodir: true
  });

  const generatedDir = path.join(
    cssSourceDir,
    "elm-stuff",
    "generated-code",
    "rtfeldman",
    "elm-css"
  );

  return findExposedValues(
    ["Css.Class.Class", "Css.Snippet"],
    readElmiPath,
    generatedDir,
    elmFilePaths,
    [cssSourceDir],
    true
  )
    .then(function(modules) {
      const writeClasses = modules.map(function(modul) {
        return writeFile(path.join(generatedDir, "classes"), modul);
      });

      const writeMainAndPackage = Promise.all([
        writeMain(generatedDir, modules)
        // TODO write ${generatedDir}/elm-package.json AFTER writeMain in the Promise.all list
      ])
        .then(function(promiseOutcomes) {
          const mainFilename = promiseOutcomes[0];

          process.chdir(generatedDir);

          return generateCssFiles(
            mainFilename,
            path.join(generatedDir, jsEmitterFilename),
            outputDir,
            pathToMake
          );
        })
        .catch(resetWorkingDir);

      return Promise.all([writeMainAndPackage].concat(writeClasses))
        .then(function(promiseOutcomes) {
          const mainFilename = promiseOutcomes[0];

          process.chdir(originalWorkingDir);

          return Promise.resolve(mainFilename);
        })
        .catch(resetWorkingDir);
    })
    .catch(resetWorkingDir);
};

function generateCssFiles(
  mainElmFile,
  emitterDest,
  outputDir,
  stylesheetsModule,
  stylesheetsPort,
  pathToMake
) {
  return emit(mainElmFile, emitterDest, pathToMake).then(
    writeResults(outputDir)
  );
}

function emit(
  src /*: string */,
  dest /*: string */,
  pathToMake /*: ?string */
) {
  // Compile the js file.
  return compileEmitter(src, {
    output: dest,
    yes: true,
    pathToMake: pathToMake
  })
    .then(function() {
      return hackMain(dest);
    })
    .then(function() {
      return extractCssResults(dest);
    });
}

function writeResults(outputDir) {
  return function(results) {
    return Promise.all(results.map(writeResult(outputDir)));
  };
}

function writeResult(outputDir) {
  return function(result) {
    return new Promise(function(resolve, reject) {
      const filename = path.join(outputDir, result.filename);
      // It's important to call path.dirname explicitly,
      // because result.filename can have directories in it!
      const directory = path.dirname(filename);

      mkdirp(directory, function(dirError) {
        if (dirError) return reject(dirError);

        fs.writeFile(filename, result.content + "\n", function(
          fileError,
          file
        ) {
          if (fileError) return reject(fileError);

          resolve(result);
        });
      });
    });
  };
}

function reportFailures(failures) {
  return (
    "The following errors occurred during compilation:\n\n" +
    failures
      .map(function(result) {
        return result.filename + ": " + result.content;
      })
      .join("\n\n")
  );
}

function compileEmitter(src, options) {
  return new Promise(function(resolve, reject) {
    compile(src, options).on("close", function(exitCode) {
      if (exitCode === 0) {
        resolve();
      } else {
        reject("Errored with exit code " + exitCode);
      }
    });
  });
}
