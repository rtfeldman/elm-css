//@flow

const compile = require("node-elm-compiler").compile,
  fs = require("fs-extra"),
  path = require("path"),
  util = require("util"),
  _ = require("lodash"),
  firstline = require("firstline"),
  child_process = require("child_process");

// This compiles all the tests so that we generate *.elmi files for them,
// which we can then read to determine which tests need to be run.
module.exports = function compileAll(
  pathToMake /*: ?string */,
  cwd /*: string */,
  testFilePaths /*: Array<string> */
) {
  return new Promise(function(resolve, reject) {
    var compileProcess = compile(testFilePaths, {
      output: "/dev/null",
      verbose: false,
      cwd: cwd,
      yes: true,
      pathToMake: pathToMake,
      warn: true,
      processOpts: { stdio: ["ignore", "ignore", "inherit"] }
    });

    compileProcess.on("close", function(exitCode) {
      if (exitCode !== 0) {
        reject(
          "Compilation failed while attempting to build " +
            testFilePaths.join(" ")
        );
      } else {
        resolve();
      }
    });
  });
};
