//@flow

/*::
type ModuleDeclaration = {
  name: string,
  values: Array<{ name : string, signature : string }>
}
*/

const fs = require("fs-extra"),
  mkdirp = require("mkdirp"),
  _ = require("lodash"),
  classNameForValue = require("./generate-class-modules").classNameForValue,
  path = require("path");

function writeMain(modules /*: Array<ModuleDeclaration> */) {
  const dirname = path.join(
    process.cwd(),
    "css",
    "elm-stuff",
    "generated-code",
    "rtfeldman",
    "elm-css",
    "src"
  );

  const contents = generateMain(modules);

  return new Promise(function(resolve, reject) {
    mkdirp(dirname, function(dirError) {
      if (dirError) return reject(dirError);
      const filename = path.join(dirname, "Main.elm");

      fs.writeFile(filename, contents, function(fileError) {
        if (fileError) return reject(fileError);

        resolve(filename);
      });
    });
  });
}

function generateMain(modules /*: Array<ModuleDeclaration> */) {
  const otherModules = ["Css", "Css.File"];
  const imports = otherModules
    .concat(_.map(modules, "name"))
    .map(function(importName) {
      return "import " + importName;
    })
    .join("\n");

  const fileStructure =
    "fileStructure : Css.File.CssFileStructure\n" +
    "fileStructure =\n" +
    "    Css.File.toFileStructure\n        [ " +
    modules.map(generateModule).join("\n        , ") +
    "\n        ]";

  const end =
    "port files : Css.File.CssFileStructure -> Cmd msg\n\n\n" +
    "main : Css.File.CssCompilerProgram\n" +
    "main =\n    Css.File.compiler files fileStructure\n";

  return ["port module Main exposing (main)", imports, fileStructure, end].join(
    "\n\n\n"
  );
}

function generatePlainSnippet(moduleName /*: string*/, valueName /*: string*/) {
  return moduleName + "." + valueName;
}

function generateClassSnippet(moduleName /*: string*/, valueName /*: string*/) {
  return null; // TODO actually do this
}

function generateStylesheet(modul /*: ModuleDeclaration */) {
  const entries = modul.values.map(function(value) {
    switch (value.signature) {
      case "Css.Snippet":
        return generatePlainSnippet(modul.name, value.name);
      case "Css.Class.Class":
        return generateClassSnippet(modul.name, value.name);
      default:
        throw Error("Unsupported signature " + value.signature);
    }
  });

  // TODO we don't need this _.compact after implementing class snippets
  return (
    "Css.File.compile [ Css.stylesheet [ " +
    _.compact(entries).join(", ") +
    " ] ]"
  );
}

function generateModule(modul /*: ModuleDeclaration */) {
  const filename = modul.name.replace(".", path.sep) + ".css";
  // ("homepage.css", Css.File.compile[Homepage.css])
  return '( "' + filename + '", ' + generateStylesheet(modul) + " )";
}

module.exports = {
  writeMain: writeMain
};
