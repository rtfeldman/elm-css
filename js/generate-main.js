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
  path = require("path");

function writeMain(modules /*: Array<ModuleDeclaration> */) {
  const dirname = path.join(
    process.cwd(),
    "css",
    "elm-stuff",
    "generated-code",
    "rtfeldman",
    "elm-css"
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
    "fileStructure: CssFileStructure\n" +
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

function generateModule(modul /*: ModuleDeclaration */) {
  // ("homepage.css", Css.File.compile[Homepage.css])
  return "(code for " + modul.name + ")";
}

module.exports = {
  writeMain: writeMain
};
