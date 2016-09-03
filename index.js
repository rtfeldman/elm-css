var fs = require("fs");
var tmp = require("tmp");
var path = require("path");
var compile = require("node-elm-compiler").compile;
var jsEmitterFilename = "emitter.js";

var KNOWN_MODULES =
  [
    "Native",
    "fullscreen",
    "embed",
    "worker",
    "Basics",
    "Maybe",
    "List",
    "Array",
    "Char",
    "Color",
    "Transform2D",
    "Text",
    "Graphics",
    "Debug",
    "Result",
    "Task",
    "Signal",
    "String",
    "Dict",
    "Json",
    "Regex",
    "VirtualDom",
    "Html",
    "Css"
  ];

// elmModuleName is optional, and is by default inferred based on the filename.
module.exports = function(projectDir, stylesheetsPath, outputDir, stylesheetsModule, stylesheetsPort, pathToMake) {

  var originalWorkingDir = process.cwd();
  process.chdir(projectDir);

  return createTmpDir()
    .then(function (tmpDirPath) {
      return generateCssFiles(
        stylesheetsPath,
        path.join(tmpDirPath, jsEmitterFilename),
        outputDir,
        stylesheetsModule || "Stylesheets",
        stylesheetsPort || "files",
        pathToMake
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

function generateCssFiles(stylesheetsPath, emitterDest, outputDir, stylesheetsModule, stylesheetsPort, pathToMake) {
  return emit(stylesheetsPath, emitterDest, stylesheetsModule, stylesheetsPort, pathToMake)
    .then(writeResults(outputDir));
}

function emit(src, dest, stylesheetsModule, stylesheetsPort, pathToMake) {
    // Compile the temporary file.
  return compileEmitter(src, {output: dest, yes: true, pathToMake: pathToMake})
    .then(extractCssResults(dest, stylesheetsModule, stylesheetsPort));
}

function suggestModulesNames(Elm){
  return Object.keys(Elm).filter(function(key){
    return KNOWN_MODULES.indexOf(key) === -1;
  })
}

function missingEntryModuleMessage(stylesheetsModule, Elm){
  var errorMessage = "I couldn't find the entry module " + stylesheetsModule + ".\n";
  var suggestions = suggestModulesNames(Elm);

  if (suggestions.length > 1){
    errorMessage += "\nMaybe you meant one of these: " + suggestions.join(",");
  } else if (suggestions.length === 1){
    errorMessage += "\nMaybe you meant: " + suggestions;
  }

  errorMessage += "\nYou can pass me a different module to use with --module=<moduleName>";

  return errorMessage;
}

function noPortsMessage(stylesheetsModule, stylesheetsPort){
  var errorMessage = "The module " + stylesheetsModule + " doesn't expose any ports!\n";

  errorMessage += "\nI was looking for a port called `" + stylesheetsPort + "` but couldn't find it!";
  errorMessage += "\n\nTry adding something like";
  errorMessage += `
port ${stylesheetsPort} : CssFileStructure
port ${stylesheetsPort} =
  toFileStructure
    []

to ${stylesheetsModule}!
`;

  return errorMessage.trim();
}

function noMatchingPortMessage(stylesheetsModule, stylesheetsPort, ports){
  var errorMessage = `The module ${stylesheetsModule} has no port called ${stylesheetsPort}.\n`;
  errorMessage += "\nI was looking for a port called `" + stylesheetsPort + "` but couldn't find it!";

  var portKeys = Object.keys(ports);

  if (portKeys.length === 1){
    errorMessage += "\nHowever, I did find the port: " + portKeys[0];
    errorMessage += "\nMaybe you meant that instead?";
  } else {
    errorMessage += "\nHowever, I did find the ports : " + Object.keys(ports).join(",");
  }

  errorMessage += "\n\nYou can specify which port to use by doing";
  errorMessage += "\nelm-css -p <port-name>";

  return errorMessage.trim();
}

/*
This is a poor man's type error. To get better error messages, might be worth
considered moving to how elm-static-site does it instead, and use Elm's compiler
for type errors!
*/
function portTypeErrorMessage(stylesheetsModule, stylesheetsPort, portValue){
  var errorMessage = `
The type of the port ${stylesheetsPort} was not what I wanted!
I was expecting a List CssFileStructure but got ${typeof portValue}!
`;

  return errorMessage.trim();
}

function extractCssResults(dest, stylesheetsModule, stylesheetsPort) {
  return function () {
    return new Promise(function (resolve, reject) {
      var Elm = require(dest);

      if (!(stylesheetsModule in Elm)){
        return reject(missingEntryModuleMessage(stylesheetsModule, Elm));
      }

      var worker = Elm[stylesheetsModule].worker();

      if (Object.keys(worker.ports).length === 0){
        return reject(noPortsMessage(stylesheetsModule, stylesheetsPort));
      }

      if (!(stylesheetsPort in worker.ports)){
        return reject(noMatchingPortMessage(stylesheetsModule, stylesheetsPort, worker.ports));
      }

      worker.ports[stylesheetsPort].subscribe(function (stylesheets) {
        if (!Array.isArray(stylesheets)){
          return reject(portTypeErrorMessage(stylesheetsModule, stylesheetsPort, stylesheets));
        }

        var failures = stylesheets.filter(function(result) {
          return !result.success;
        });

        return failures.length > 0
        ? reject(reportFailures(failures))
        : resolve(stylesheets);
      });
    });
  };
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
