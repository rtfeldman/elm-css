var fs = require("fs-extra");

function readExposing(file) {
  return new Promise(function(resolve, reject) {
    // read 60 chars at a time. roughly optimal: memory vs performance
    var stream = fs.createReadStream(file, {
      encoding: "utf8",
      highWaterMark: 8 * 60
    });
    var buffer = "";
    var parser = new Parser();

    stream.on("error", reject);

    stream.on("data", function(chunk) {
      buffer += chunk;
      // when the chunk has a newline, process each line
      if (chunk.indexOf("\n") > -1) {
        var lines = buffer.split("\n");

        lines.slice(0, lines.length - 1).forEach(parser.parseLine.bind(parser));
        buffer = lines[lines.length - 1];

        // end the stream early if we're past the exports
        // to save on memory
        if (parser.isDoneReading()) {
          stream.destroy();
        }
      }
    });
    stream.on("close", function() {
      if (parser.getIsMissingModuleName())
        return reject(filePath + " is missing a module declaration.");

      resolve(parser.getExposing());
    });
  });
}

/* Remove all the comments from the line, and return whether we are still in a multiline comment or not
*/
var stripComments = function(line, isInComment) {
  while (true || line.length > 0) {
    var startIndex = line.indexOf("{-");
    var endIndex = line.indexOf("-}");
    var singleLineComment = line.indexOf("--");

    // when we have a single line comment
    if (singleLineComment > -1 && !isInComment) {
      line = line.substr(0, singleLineComment);
      continue;
    }

    // when there's no comment chars
    if (startIndex === -1 && endIndex === -1) {
      return {
        line: isInComment ? "" : line,
        isInComment: isInComment
      };
    }

    // when there's a start and end
    if (startIndex > -1 && endIndex > -1) {
      line = line.substr(0, startIndex) + line.substr(endIndex + 2);
      continue;
    }

    // when there's a start, but no end
    if (startIndex > -1)
      return { line: line.substr(0, startIndex), isInComment: true };

    // when there's an end, but no start
    if (endIndex > -1 && isInComment)
      return { line: line.substr(endIndex + 2), isInComment: false };
  }

  return { line: "", isInComment: isInComment };
};

var splitExposedFunctions = function(exposingLine) {
  return exposingLine
    .substr(0, exposingLine.lastIndexOf(")"))
    .split(",")
    .map(str => str.trim())
    .filter(str => str[0].toLowerCase() === str[0]);
};

var isAModuleLine = function(line) {
  return (
    line.startsWith("module") ||
    line.startsWith("port module") ||
    line.startsWith("effect module")
  );
};

function Parser() {
  // if we're currently in a comment
  var isInComment = false;

  // if the file does not have a module line
  var isMissingModuleName = false;

  // if we're done parsing
  var parsingDone = false;

  // if the module line has been read
  var hasModuleLineBeenRead = false;

  var isReadingModuleName = false;
  var isReadingExports = false;
  var isBetweenBrackets = false;

  // functions that have been exposed
  var exposedFunctions = [];
  // number of open/closed brackets seen so far
  var openBracketsSeen = 0;
  var closedBracketsSeen = 0;
  // data between exposing brackets
  var data = "";

  this.parseLine = function(line) {
    if (parsingDone) return;

    var whereWeUpTo = stripComments(line, isInComment);
    isInComment = whereWeUpTo.isInComment;
    line = whereWeUpTo.line.trim();

    if (line.length == 0) return;

    // if we haven't started reading the first line
    if (!hasModuleLineBeenRead && isAModuleLine(line)) {
      hasModuleLineBeenRead = true;
      // drop module from the line
      line = line.substr(line.indexOf("module") + 7);
      isReadingModuleName = true;

      if (line.length === 0) return;
    }

    // if we manage to find content before the module line,
    // something is wrong - so exit
    if (!hasModuleLineBeenRead) {
      isMissingModuleName = true;
      parsingDone = true;
      return;
    }

    // if we are still reading the module line
    if (isReadingModuleName) {
      var exposingIndex = line.indexOf("exposing");

      // if we haven't found exposing yet
      if (exposingIndex === -1) {
        return;
      }

      line = line.substr(exposingIndex + 8);
      isReadingModuleName = false;
      isReadingExports = true;

      if (line.length === 0) return;
    }

    // if we are actually reading the exports
    if (isReadingExports) {
      var firstBracket = line.indexOf("(");
      if (firstBracket === -1) return;

      openBracketsSeen += 1;
      isReadingExports = false;
      isBetweenBrackets = true;
      line = line.substr(firstBracket + 1);
    }

    // if we're before the final bracket
    if (isBetweenBrackets) {
      var newOpenBracketsSeen = line.split("(").length;
      var newCloseBracketsSeen = line.split(")").length;

      closedBracketsSeen += newCloseBracketsSeen;
      openBracketsSeen += newOpenBracketsSeen;

      data += line;

      if (closedBracketsSeen === openBracketsSeen) {
        exposedFunctions = splitExposedFunctions(data);
        parsingDone = true;
      }
    }
  };

  this.isDoneReading = function() {
    return parsingDone;
  };

  this.getExposing = function() {
    return exposedFunctions;
  };

  this.getIsMissingModuleName = function() {
    return isMissingModuleName;
  };

  return this;
}

module.exports = {
  readExposing: readExposing,
  stripComments: stripComments,
  Parser: Parser
};
