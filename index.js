//@flow

const _ = require("lodash"),
  path = require("path"),
  glob = require("glob"),
  mkdirp = require("mkdirp"),
  findExposedValues = require("./js/find-exposed-values").findExposedValues,
  writeGeneratedElmPackage = require("./js/generate-elm-package"),
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
  const cssElmPackageJson = path.join(cssSourceDir, "elm-package.json");

  if (!fs.existsSync(cssElmPackageJson)) {
    mkdirp.sync(cssSourceDir);

    // TODO do an init here
  }

  const elmFilePaths = findElmFiles(cssSourceDir);
  const generatedDir = path.join(
    projectDir,
    "elm-stuff",
    "generated-code",
    "rtfeldman",
    "elm-css"
  );

  // Symlink our existing elm-stuff into the generated code,
  // to avoid re-downloading and recompiling things we already
  // just downloaded and compiled.
  var generatedElmStuff = path.join(generatedDir, "elm-stuff");

  mkdirp.sync(generatedDir);

  if (!fs.existsSync(generatedElmStuff)) {
    fs.symlinkSync(
      path.join(cssSourceDir, "elm-stuff"),
      generatedElmStuff,
      "junction" // Only affects Windows, but necessary for this to work there. See https://github.com/gulpjs/vinyl-fs/issues/210
    );
  }

  const generatedSrc = path.join(generatedDir, "src");
  const mainFilename = path.join(generatedSrc, "Main.elm");

  const makeGeneratedSrcDir = new Promise(function(resolve, reject) {
    mkdirp(generatedSrc, function(error) {
      if (error) reject(error);

      resolve();
    });
  });

  return Promise.all([
    writeGeneratedElmPackage(generatedDir, generatedSrc, cssSourceDir),
    makeGeneratedSrcDir,
    compileAll(pathToMake, cssSourceDir, elmFilePaths)
  ]).then(function(promiseOutputs) {
    const repository /*: string */ = promiseOutputs[0];

    return findExposedValues(
      ["Css.File.UniqueClass", "Css.Snippet"],
      readElmiPath,
      generatedDir,
      elmFilePaths,
      [cssSourceDir],
      true
    ).then(function(modules) {
      return Promise.all(
        [writeMain(mainFilename, modules)].concat(
          modules.map(function(modul) {
            return writeFile(path.join(generatedDir, "styles"), modul);
          })
        )
      ).then(function() {
        return emit(
          mainFilename,
          repository,
          path.join(generatedDir, jsEmitterFilename),
          generatedDir,
          pathToMake
        ).then(writeResults(outputDir));
      });
    });
  });
};

function emit(
  src /*: string */,
  repository /*: string */,
  dest /*: string */,
  cwd /*: string */,
  pathToMake /*: ?string */
) {
  // Compile the js file.
  return compileEmitter(src, {
    output: dest,
    yes: true,
    cwd: cwd,
    pathToMake: pathToMake
  })
    .then(function() {
      return hackMain(repository, dest);
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
