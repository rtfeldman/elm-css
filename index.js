var fs = require("fs");
var tmp = require("tmp");
var path = require("path");
var compile = require("node-elm-compiler").compile;
var jsEmitterFilename = "emitter.js";
var cp = require("node-cp");
var replaceStream = require("replacestream");

var templatesDir = path.join(__dirname, "templates", "emitter");
var elmPackageFilename = "elm-package.json";
var elmPackageSrc = path.join(templatesDir, elmPackageFilename);
var emitterFilename = "Emitter.elm"
var emitterSrc = path.join(templatesDir, emitterFilename);

// elmModuleName is optional, and is by default inferred based on the filename.
module.exports = function(srcElmFile, destCssFile, elmModuleName) {
  return new Promise(function(resolve, reject) {
    var originalWorkingDir = process.cwd();

    tmp.dir(function (err, tmpDirPath) {
      if (err) {
        return reject(err);
      }

      if (!elmModuleName) {
        elmModuleName = path.basename(srcElmFile, ".elm");
      }

      process.chdir(tmpDirPath);

      return generateCssFile(
        tmpDirPath, srcElmFile, elmModuleName, destCssFile
      ).then(function(result) {
        process.chdir(originalWorkingDir);
        resolve(result);
      }, function(err) {
        process.chdir(originalWorkingDir);
        reject(result);
      });
    });
  });
}

function generateCssFile(tmpDirPath, srcElmFile, elmModuleName, destCssFile) {
  return new Promise(function(resolve, reject) {
    var elmPackageDest = path.join(tmpDirPath, elmPackageFilename);
    var emitterDest = path.join(tmpDirPath, emitterFilename);
    var jsEmitterDest = path.join(tmpDirPath, jsEmitterFilename);

    return Promise.all([
      prepareElmPackageJson(elmPackageSrc, elmPackageDest, srcElmFile),
      prepareEmitter(emitterSrc, emitterDest, elmModuleName)
    ]).then(function(){
      return emit(emitterDest, jsEmitterDest).then(function(content) {
        fs.writeFile(destCssFile, content + "\n", function(err, file) {
          return err ? reject(err) : resolve(file);
        });
      }, reject);
    }, reject);
  });
}

function prepareElmPackageJson(src, dest, srcElmFile) {
  return new Promise(function(resolve, reject) {
    // Substitute the target source dir into our temporary elm-package.json
    fs.createReadStream(src)
      .pipe(replaceStream(
          "$nameOfTargetSourceDirectoryGoesHere",

          // BEGIN HACKY WORKAROUND
          //
          // once elm-css has been published,
          // templates/emitter/elm-package.json can include this
          // as a depdencency: "rtfeldman/elm-css": "1.0.0 <= v < 2.0.0"
          // - but until then, we hack it into the sources list like so:
          path.join(__dirname, "src\",\n        \"") +
          // ...but once it's been published and we can add that dependency
          // to elm-package.json, we can chop out this workaround.
          //
          // END HACKY WORKAROUND

          path.dirname(srcElmFile),
          { limit: 1 }
        )
      )
      .pipe(fs.createWriteStream(dest))
      .on("close", resolve)
      .on("error", reject);
  });
}

function prepareEmitter(src, dest, elmModuleName) {
  return new Promise(function(resolve, reject) {
    // Substitute the target module name into our temporary Emitter.elm
    fs.createReadStream(src)
      .pipe(replaceStream("NameOfSourceModuleGoesHere", elmModuleName, {limit: 1}))
      .pipe(fs.createWriteStream(dest))
      .on("close", resolve)
      .on("error", reject);
  });
}

function emit(src, dest) {
  return new Promise(function(resolve, reject) {
    // Compile the temporary file.
    compileEmitter(src, {output: dest, yes: true}).then(function() {
      // Make the compiled emitter.js Node-friendly.
      fs.appendFile(dest, "\nmodule.exports = Elm;", function(err) {
        if (err) {
          return reject(err);
        }

        var Elm = require(dest);
        var result = Elm.worker(Elm.Emitter).ports.cssOutput;

        return result.success
          ? resolve(result.content)
          : reject("Compilation error: " + result.content);
      });
    }, reject);
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
