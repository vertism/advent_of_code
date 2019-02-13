const fs = require("fs");
const input = fs.readFileSync("Day1/input", "utf8");
const inputValues = input.split("\n").filter(l => l);

var drift = 0;
var foundMatch = false;
var matchingValue;
let value = 0;

const values = new Set();

while (!foundMatch) {
  drift = inputValues.reduce((acc, val) => {
    value = acc + Number(val);
    if (values.has(value) && typeof matchingValue === "undefined") {
      foundMatch = true;
      matchingValue = value;
    } else {
      values.add(value);
    }
    return value;
  }, drift);
}

console.log(matchingValue);
