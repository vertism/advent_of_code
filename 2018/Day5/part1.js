const fs = require("fs");
let input = fs.readFileSync("Day5/input", "utf8");

let forDeletion;

while (!forDeletion || forDeletion.size) {
  forDeletion = new Set();
  let skip = false;

  for (let i = 0; i < input.length; i++) {
    if (skip) {
      skip = false;
      continue;
    }

    let current = input[i];
    let next = input[i + 1];

    if (
      next &&
      current !== next &&
      current.toLowerCase() === next.toLowerCase()
    ) {
      forDeletion.add(i);
      forDeletion.add(i + 1);
      skip = true;
    }
  }

  input = input
    .trim()
    .split("")
    .filter((_, index) => {
      return !forDeletion.has(index);
    })
    .join("");
}

console.log(input.length);
