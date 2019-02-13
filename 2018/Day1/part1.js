const fs = require("fs");
const input = fs.readFileSync("Day1/input", "utf8");

const drift = input.split("\n").reduce((acc, value) => {
  return acc + Number(value);
}, 0);

console.log(drift);
