//@flow

const _ = require("lodash"),
  path = require("path"),
  glob = require("glob"),
  findExposedValues = require("./find-exposed-values").findExposedValues,
  writeMain = require("./generate-main").writeMain,
  writeFile = require("./generate-class-modules").writeFile,
  fs = require("fs-extra");

const binaryExtension = process.platform === "win32" ? ".exe" : "";
const readElmiPath =
  path.join(__dirname, "..", "bin", "elm-interface-to-json") + binaryExtension;

const cssSourceDir = path.join(process.cwd(), "css");
// TODO use resolveFilePath from node-test-runner instead
const elmFilePaths = glob.sync("/**/*.elm", {
  root: cssSourceDir,
  nocase: true,
  ignore: "/**/elm-stuff/**",
  nodir: true
});

findExposedValues(
  ["Css.Class.Class", "Css.Snippet"],
  readElmiPath,
  path.join(process.cwd(), "css"),
  elmFilePaths,
  [cssSourceDir],
  true
)
  .then(function(modules) {
    return Promise.all(
      [writeMain(modules)].concat(
        modules.map(function(modul) {
          return writeFile(
            path.join(
              process.cwd(),
              "css",
              "elm-stuff",
              "generated-code",
              "rtfeldman",
              "elm-css"
            ),
            modul
          );
        })
      )
    )
      .then(function(results) {
        const mainFilename = results[0];

        console.log("wrote", mainFilename); // TODO run index.js on this file
      })
      .catch(function(error) {
        console.error(error);
        process.exit(1);
      });
  })
  .then(function() {
    console.log("Done!");
  })
  .catch(function(error) {
    console.error(error);
    process.exit(1);
  });
