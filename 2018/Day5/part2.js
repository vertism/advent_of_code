const fs = require("fs");
let input = fs.readFileSync("Day5/input", "utf8");

const reduce = input => {
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

  return input.length;
};

const alphabet = "abcdefghijklmnopqrstuvwxyz".split("");

const bestLength = alphabet.reduce((acc, letter) => {
  const newInput = input
    .split("")
    .filter(l => l.toLowerCase() !== letter)
    .join("");
  console.log(newInput);
  const length = 1;
  //   const length = reduce(newInput);

  if (length > acc) {
    return length;
  } else {
    return acc;
  }
}, 0);

console.log(bestLength);
