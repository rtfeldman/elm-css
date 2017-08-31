//@flow

const _ = require("lodash"),
  path = require("path"),
  glob = require("glob"),
  findExposedValues = require("./find-exposed-values").findExposedValues,
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
  ["Css.Class", "Css.Snippet"],
  readElmiPath,
  "/home/rtfeldman/code/elm-css/examples/generated-classes/css/",
  elmFilePaths,
  [cssSourceDir],
  true
).then(function(stuff) {
  console.log("Stuff", JSON.stringify(stuff));
});
