var assert = require("chai").assert;
var path = require("path");
var emitter = require(path.join(__dirname, ".."));
var fs = require("fs");

var fixturesDir = path.join(__dirname, "fixtures");

describe("emitting", function() {
  it("works with HomepageCss.elm", function (done) {
    // Use an epic timeout, because Travis on Linux is SO SLOW.
    this.timeout(6000000);

    var projectDir = path.join(__dirname, "..", "examples");
    var srcFile = path.join(projectDir, "src", "Stylesheets.elm");
    var outputDir = __dirname;

    emitter(projectDir, srcFile, outputDir).then(function() {
      var expectedFile = path.join(fixturesDir, "homepage-compiled.css");
      var expected = fs.readFileSync(expectedFile, {encoding: "utf8"});
      var actual = fs.readFileSync(path.join(outputDir, "homepage.css"), {encoding: "utf8"});

      return assert.strictEqual(expected, actual);
    }).then(done, function() { setTimeout(assert.fail, 1); });
  });
});
