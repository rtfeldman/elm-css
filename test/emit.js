var assert = require("chai").assert;
var path = require("path");
var emitter = require(path.join(__dirname, ".."));
var fs = require("fs");

var fixturesDir = path.join(__dirname, "fixtures");

function prependFixturesDir(filename) {
  return path.join(fixturesDir, filename);
}

describe("emitting", function() {
  it("works with HomepageCss.elm", function (done) {
    // Use a timeout of 10 minutes, because one time even 5 minutes wasn't
    // enough for Travis on Linux.
    this.timeout(600000);

    var projectDir = path.join(__dirname, "..", "examples");
    var srcFile = path.join(projectDir, "src", "Stylesheets.elm");
    var outputDir = __dirname;

    emitter(projectDir, srcFile, outputDir).then(function() {
      var expectedFile = path.join(fixturesDir, "homepage-compiled.css");
      var expected = fs.readFileSync(expectedFile, {encoding: "utf8"});
      var actual = fs.readFileSync(path.join(outputDir, "homepage.css"), {encoding: "utf8"});

      assert.strictEqual(expected, actual);
      done();
    }, assert.fail);
  });
});
