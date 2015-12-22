var assert = require("chai").assert;
var path = require("path");
var emitter = require(path.join(__dirname, ".."));
var fs = require("fs");

var fixturesDir = path.join(__dirname, "fixtures");

function prependFixturesDir(filename) {
  return path.join(fixturesDir, filename);
}

describe("emitting", function() {
  it("works with HomepageStylesheet.elm", function (done) {
    // Use a timeout of 5 minutes because Travis on Linux can be SUPER slow.
    this.timeout(300000);

    var srcFile = path.join(__dirname, "..", "examples", "src", "HomepageStylesheet.elm");
    var destCssFile = path.join(__dirname, "output.css")

    emitter(srcFile, destCssFile).then(function() {
      var expectedFile = path.join(fixturesDir, "homepage-compiled.css");
      var expected = fs.readFileSync(expectedFile, {encoding: "utf8"});
      var actual = fs.readFileSync(destCssFile, {encoding: "utf8"});

      assert.strictEqual(expected, actual);
      done();
    }, assert.fail);
  });
});
