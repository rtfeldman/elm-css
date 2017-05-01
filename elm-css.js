#!/usr/bin/env node

var elmCss = require('./');
var program = require('commander');
var chalk = require('chalk');
var pkg = require('./package.json');
var sourcePath = null;

program
  .version(pkg.version)
  .usage('PATH # path to your Stylesheets.elm file')
  .option('-o, --output [outputDir]', '(optional) directory in which to write CSS file', process.cwd())
  .option('-m, --module [moduleName]', '(optional) name of stylesheets module in your project', null, 'Stylesheets')
  .option('-p, --port [portName]', '(optional) name of the port from which to read CSS results', null, 'files')
  .option('-r, --root [projectDir]', '(optional) root directory of the project', process.cwd())
  .option('-e, --pathToMake [pathToMake]', '(optional) path to elm-make')
  .action(function(src) {
    sourcePath = src;
  })
  .parse(process.argv);

if(!sourcePath) {
  console.log(chalk.red("You must specifiy a path to your Stylesheets.elm file. See the README for information on how to build a Stylesheets.elm file."));
  program.outputHelp();
  process.exit(1);
}

elmCss(
  program.root,
  sourcePath,
  program.output,
  program.module,
  program.port,
  program.pathToMake
).then(function (results) {
  console.log(chalk.green('Successfully generated output! The following css files were created: '));
  results.forEach(function (result) {
    console.log(chalk.blue('- ' + result.filename));
  });
}).catch(function (error) {
  console.log(chalk.red(error));
  process.exit(1);
});
