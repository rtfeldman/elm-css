#!/usr/bin/env node
//@flow

const elmCss = require("../"),
  program = require("commander"),
  chalk = require("chalk"),
  _ = require("lodash"),
  path = require("path"),
  pkg = require("../package.json");

program
  .version(pkg.version)
  .usage("PATH # path to your Stylesheets.elm file")
  .option(
    "-o, --output [outputDir]",
    "(optional) directory in which to write CSS files. Defaults to build/",
    path.join(process.cwd(), "build")
  )
  .option("-m, --pathToMake [pathToMake]", "(optional) path to elm-make")
  .parse(process.argv);

const headline = "elm-css " + pkg.version;
const bar = _.repeat("-", headline.length);

console.log("\n" + headline + "\n" + bar + "\n");

elmCss(process.cwd(), program.output, program.pathToMake)
  .then(function(results) {
    console.log(chalk.green("Success! I created these css files:"));
    results.forEach(function(result) {
      console.log(chalk.blue("- " + result.filename));
    });
  })
  .catch(function(error) {
    console.error(chalk.red(error));
    process.exit(1);
  });
