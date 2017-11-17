//@flow
const fs = require("fs-extra"),
  _ = require("lodash"),
  path = require("path"),
  glob = require("glob");

// Recursively search directories for *.elm files, excluding elm-stuff/
module.exports = function findElmFiles(
  filename /*: string */
) /*: Array<string> */ {
  var candidates /*: Array<string> */;

  if (!fs.existsSync(filename)) {
    candidates = [];
  } else if (fs.lstatSync(filename).isDirectory()) {
    candidates = _.flatMap(
      glob.sync("/**/*.elm", {
        root: filename,
        nocase: true,
        ignore: "/**/elm-stuff/**",
        nodir: true
      }),
      findElmFiles
    );
  } else {
    candidates = [path.resolve(filename)];
  }

  // Exclude everything having anything to do with elm-stuff
  return candidates.filter(function(candidate) {
    return candidate.split(path.sep).indexOf("elm-stuff") === -1;
  });
};
