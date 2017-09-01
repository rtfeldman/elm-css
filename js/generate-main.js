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

// TODO also need to write elm-package.json in that directory.
function writeMain(
  generatedDir /*:string */,
  modules /*: Array<ModuleDeclaration> */
) {
  const dirname = path.join(generatedDir, "src");

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
  const otherModules = ["Css", "Css.Class", "Css.File", "Json.Decode"]; // Json.Decode is needed to avoid a bug in Elm 0.18 where port modules need it to be imported; may be able to remove that import in 0.19
  const imports = otherModules
    .concat(_.map(modules, "name"))
    .map(function(importName) {
      return "import " + importName;
    })
    .join("\n");

  const fileStructure =
    "fileStructure : () -> Css.File.CssFileStructure\n" +
    "fileStructure _ =\n" +
    "    Css.File.toFileStructure\n        [ " +
    modules.map(generateModule).join("\n        , ") +
    "\n        ]";

  const end =
    "port files : Css.File.CssFileStructure -> Cmd msg\n\n\n" +
    "classToSnippet : String -> Css.Class.Class -> Css.Snippet\n" +
    "classToSnippet str class =\n" +
    "    classToSnippet str class\n\n\n" + // This is just to make type-checking pass. We'll splice in a useful implementation after emitting.
    "main : Css.File.CssCompilerProgram\n" +
    "main =\n    Css.File.compiler files fileStructure\n";

  return ["port module Main exposing (main)", imports, fileStructure, end].join(
    "\n\n\n"
  );
}

function generateStylesheet(modul /*: ModuleDeclaration */) {
  const entries = modul.values.map(function(value) {
    switch (value.signature) {
      case "Css.Snippet":
        return modul.name + "." + value.name;
      case "Css.Class.Class":
        const className = classNameForValue(modul.name, value.name);

        return (
          'classToSnippet "' + className + '" ' + modul.name + "." + value.name
        );
      default:
        throw Error("Unsupported signature " + value.signature);
    }
  });

  return "Css.File.compile [ Css.stylesheet [ " + entries.join(", ") + " ] ]";
}

function generateModule(modul /*: ModuleDeclaration */) {
  const filename = modul.name.replace(".", path.sep) + ".css";
  // ("homepage.css", Css.File.compile[Homepage.css])
  return '( "' + filename + '", ' + generateStylesheet(modul) + " )";
}

module.exports = {
  writeMain: writeMain
};
