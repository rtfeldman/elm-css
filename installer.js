//@flow

module.exports = function(verbose /*: ?bool */) {
  const binstall = require("binstall");
  const path = require("path");
  const fs = require("fs");
  const packageInfo = require("./package.json");

  // Use major.minor.patch from version string - e.g. "1.2.3" from "1.2.3-alpha"
  const binVersion = packageInfo.version.match(/^(\d+\.\d+\.\d+).*$/)[1];

  // 'arm', 'ia32', or 'x64'.
  const arch = process.arch;

  // 'darwin', 'freebsd', 'linux', 'sunos' or 'win32'
  const operatingSystem = process.platform;

  const filename = operatingSystem + "-" + arch + ".tar.gz";
  const url =
    // TODO upload these binaries
    "https://dl.bintray.com/elmlang/elm-css/" + binVersion + "/" + filename;

  const binariesDir = path.join(__dirname, "bin");
  const binaryExtension = process.platform === "win32" ? ".exe" : "";
  const executablePaths = [
    path.join(binariesDir, "elm-interface-to-json" + binaryExtension)
  ];
  const errorMessage =
    "Unfortunately, there are no elm-test " +
    binVersion +
    " binaries available on your operating system and architecture.\n\nIf you would like to build Elm from source, there are instructions at https://github.com/elm-lang/elm-platform#build-from-source\n";

  return binstall(
    url,
    { path: binariesDir },
    {
      verbose: verbose,
      verify: executablePaths,
      errorMessage: errorMessage
    }
  );
};
