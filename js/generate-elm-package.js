//@flow
const path = require("path"),
  fs = require("fs-extra");

module.exports = function writeGeneratedElmPackage(
  generatedDir /*:string */,
  generatedSrc /*: string */,
  originalElmPackageDir /*: string */
) {
  const originalElmPackage = path.join(
    originalElmPackageDir,
    "elm-package.json"
  );

  return fs.readJson(originalElmPackage).then(function(elmPackageContents) {
    // Make all the source-directories absolute, and introduce a new one.
    var sourceDirs = (elmPackageContents["source-directories"] || [])
      .map(function(src) {
        return path.resolve(originalElmPackageDir, src);
      });

    elmPackageContents["source-directories"] = [
      // Include elm-stuff/generated-code/rtfeldman/elm-css/src
      // since we'll be generating Main.elm in there.
      generatedSrc
    ].concat(sourceDirs);

    // Generate the new elm-package.json
    return new Promise(function(resolve, reject) {
      fs.writeFile(
        path.join(generatedDir, "elm-package.json"),
        JSON.stringify(elmPackageContents, null, 4),
        function(writeError) {
          if (writeError)
            reject("Error writing generated elm-package.json: " + writeError);

          resolve(elmPackageContents["repository"]);
        }
      );
    });
  });
};
