var fs = require("fs");
var tmp = require("tmp");
var path = require("path");
var templatesDir = path.join(__dirname, "templates");
var compile = require("node-elm-compiler").compile;
var emitterFilename = "emitter.js";
var cp = require("node-cp");

// elmModuleName is optional, and is by default inferred based on the filename.
module.exports = function(srcElmFile, destCssFile, elmModuleName) {
  return new Promise(function(resolve, reject) {
    var originalWorkingDir = process.cwd();

    tmp.dir(function (err, tmpDirPath) {
      if (err) {
        return reject(err);
      }

      var tmpSrc = path.join(tmpDirPath, path.basename(srcElmFile));
      var tmpDest = path.join(tmpDirPath, emitterFilename);

      if (!elmModuleName) {
        elmModuleName = path.basename(srcElmFile, ".elm");
      }

      process.chdir(tmpDirPath);

      prepareAndEmit(srcElmFile, tmpSrc, tmpDest).then(function(result) {
        process.chdir(originalWorkingDir);
        resolve(result);
      }).catch(function(err) {
        process.chdir(originalWorkingDir);
        reject(result);
      });
    });
  });
}

function prepareAndEmit(srcElmFile, tmpSrc, tmpDest) {
  return new Promise(function(resolve, reject) {
    prepare(srcElmFile, tmpSrc, tmpDest).then(function() {
      emit(tmpSrc, tmpDest).then(resolve).catch(reject);
    }).catch(reject);
  });
}

function prepare(srcElmFile, tmpSrc, tmpDest) {
  return new Promise(function(resolve, reject) {
    // Copy the contents of our source file into the temporary file.
    cp(srcElmFile, tmpSrc, function(err) {
      if (err) {
        return reject(err);
      }

      // Append the ports boilerplate to the temporary file.
      fs.appendFile(src, emitterPort, function(err, file) {
        return err
          ? reject(err)
          : resolve(file);
      });
    });
  });
}

function emit(src, dest) {
  return new Promise(function(resolve, reject) {
    // Compile the temporary file.
    compileEmitter(src, {output: dest}).then(function() {
      // Make the compiled emitter.js Node-friendly.
      fs.appendFile(dest, "\nmodule.exports = Elm;", function() {
        var Elm = require(dest);
        var result = Elm.worker(Elm[elmModuleName]).ports[outputPortName];

        if(result.success) {
          fs.writeFile(destCssFile, result.content + "\n", function(err, file) {
            return err ? reject(err) : resolve(file);
          });
        } else {
          return reject("Compilation error: " + result.content);
        }
      });
    }).catch(reject);
  });
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

var outputPortName = "generatedElmCssOutputPort";
var emitterPort =
  [ "",
    "port " + outputPortName + " : { success : Bool , content : String }",
    "port " + outputPortName + " =",
    "    (\\result ->",
    "        case result of",
    "            Ok styleString ->",
    "                { success = True, content = styleString } ",
    "            Err message ->",
    "                { success = False, content = message }",
    "    )",
    ""
  ].join("\n")
