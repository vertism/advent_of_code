const fs = require("fs");
const input = fs.readFileSync("Day2/input", "utf8");
const inputValues = input.split("\n").filter(l => l);

let twos = 0;
let threes = 0;

inputValues.forEach(value => {
  const letters = value.split("").sort();
  const obj = letters.reduce((acc, letter) => {
    acc[letter] = (acc[letter] || 0) + 1;
    return acc;
  }, {});
  twos += Object.values(obj).includes(2);
  threes += Object.values(obj).includes(3);
});

console.log(twos * threes);
