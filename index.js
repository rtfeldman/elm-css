//@flow

const _ = require("lodash"),
  path = require("path"),
  glob = require("glob"),
  mkdirp = require("mkdirp"),
  findExposedValues = require("./js/find-exposed-values").findExposedValues,
  writeMain = require("./js/generate-main").writeMain,
  writeFile = require("./js/generate-class-modules").writeFile,
  findElmFiles = require("./js/find-elm-files"),
  compileAll = require("./js/compile-all"),
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

  const elmFilePaths = findElmFiles(cssSourceDir);
  const generatedDir = path.join(
    cssSourceDir,
    "elm-stuff",
    "generated-code",
    "rtfeldman",
    "elm-css"
  );

  mkdirp.sync(generatedDir);

  // Symlink our existing elm-stuff into the generated code,
  // to avoid re-downloading and recompiling things we already
  // just downloaded and compiled.
  var generatedElmStuff = path.join(generatedDir, "elm-stuff");

  if (!fs.existsSync(generatedElmStuff)) {
    fs.symlinkSync(
      path.join(cssSourceDir, "elm-stuff"),
      generatedElmStuff,
      "junction" // Only affects Windows, but necessary for this to work there. See https://github.com/gulpjs/vinyl-fs/issues/210
    );
  }

  return compileAll(pathToMake, elmFilePaths).then(function() {
    return findExposedValues(
      ["Css.Class.Class", "Css.Snippet"],
      readElmiPath,
      generatedDir,
      elmFilePaths,
      [cssSourceDir],
      true
    ).then(function(modules) {
      const writeClasses = modules.map(function(modul) {
        return writeFile(path.join(generatedDir, "classes"), modul);
      });

      const writeMainAndPackage = Promise.all([
        writeMain(generatedDir, modules)
        // TODO write ${generatedDir}/elm-package.json AFTER writeMain in the Promise.all list
      ]).then(function(promiseOutcomes) {
        const mainFilename = promiseOutcomes[0];

        process.chdir(generatedDir);

        return generateCssFiles(
          mainFilename,
          path.join(generatedDir, jsEmitterFilename),
          outputDir,
          pathToMake
        );
      });

      return Promise.all(
        [writeMainAndPackage].concat(writeClasses)
      ).then(function(promiseOutcomes) {
        const mainFilename = promiseOutcomes[0];

        return Promise.resolve(mainFilename);
      });
    });
  });
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
