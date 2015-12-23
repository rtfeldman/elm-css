var fs = require("fs");
var tmp = require("tmp");
var path = require("path");
var compile = require("node-elm-compiler").compile;
var jsEmitterFilename = "emitter.js";

// elmModuleName is optional, and is by default inferred based on the filename.
module.exports = function(projectDir, stylesheetsPath, outputDir, stylesheetsModule, stylesheetsPort) {

  var originalWorkingDir = process.cwd();
  process.chdir(projectDir);

  return createTmpDir()
    .then(function (tmpDirPath) {
      return generateCssFiles(
        stylesheetsPath,
        path.join(tmpDirPath, jsEmitterFilename),
        outputDir,
        stylesheetsModule || "Stylesheets",
        stylesheetsPort || "files"
      );
    })
    .then(function(result) {
      process.chdir(originalWorkingDir);
      return result;
    })
    .catch(function(err) {
      process.chdir(originalWorkingDir);
      throw Error(err);
    });
}

function createTmpDir() {
  return new Promise(function (resolve, reject) {
    tmp.dir(function (err, tmpDirPath) {
      if (err) {
        reject(err);
      } else {
        resolve(tmpDirPath);
      }
    });
  });
}

function generateCssFiles(stylesheetsPath, emitterDest, outputDir, stylesheetsModule, stylesheetsPort) {
  return emit(stylesheetsPath, emitterDest, stylesheetsModule, stylesheetsPort)
    .then(writeResults(outputDir));
}

function emit(src, dest, stylesheetsModule, stylesheetsPort) {
    // Compile the temporary file.
  return compileEmitter(src, {output: dest, yes: true})
    .then(makeRequirable(dest))
    .then(extractCssResults(dest, stylesheetsModule, stylesheetsPort));
}

function extractCssResults(dest, stylesheetsModule, stylesheetsPort) {
  return function () {
    return new Promise(function (resolve, reject) {
      var Elm = require(dest);
      var stylesheets = Elm.worker(Elm[stylesheetsModule]).ports[stylesheetsPort];
      var failures = stylesheets.filter(function(result) {
        return !result.success;
      });

      return failures.length > 0
      ? reject(reportFailures(failures))
      : resolve(stylesheets);
    });
  };
}

function makeRequirable(dest) {
  return function () {
    return new Promise(function (resolve, reject) {
      // Make the compiled emitter.js Node-friendly.
      fs.appendFile(dest, "\nmodule.exports = Elm;", function(err) {
        if (err) {
          reject(err);
        } else {
          resolve();
        }
      });
    });
  }
}

function writeResults(outputDir) {
  return function(results) {
    return Promise.all(
      results.map(writeResult(outputDir))
    );
  };
}

function writeResult(outputDir) {
  return function (result) {
    return new Promise(function(resolve, reject) {
      fs.writeFile(path.join(outputDir, result.filename), result.content + "\n", function(err, file) {
        return err ? reject(err) : resolve(result);
      });
    });
  }
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
