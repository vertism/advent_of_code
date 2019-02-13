const fs = require("fs");
const input = fs.readFileSync("Day2/input", "utf8");
const inputValues = input.split("\n").filter(l => l);

const nearlyMatching = [];

const offByOne = (a, b) => {
  return (
    a
      .split("")
      .map((letter, index) => letter === b[index])
      .filter(x => !x).length === 1
  );
};

const removeDiffs = array => {
  return array[0].split("").reduce((acc, letter, index) => {
    const newLetter = letter === array[1][index] ? letter : "";
    return (acc += newLetter);
  }, "");
};

inputValues.map(x => {
  inputValues.map(y => {
    if (nearlyMatching.length == 0 && offByOne(x, y)) {
      nearlyMatching.push(x);
      nearlyMatching.push(y);
    }
  });
});

console.log(removeDiffs(nearlyMatching));
