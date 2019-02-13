const fs = require("fs");
const input = fs.readFileSync("Day3/input", "utf8");
const inputValues = input.split("\n").filter(l => l);

let re = /\#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/;
maxX = 0;
maxY = 0;

const claims = inputValues.map(claim => {
  let result = re.exec(claim);

  const id = Number(result[1]);
  const x = Number(result[2]);
  const y = Number(result[3]);
  const width = Number(result[4]);
  const height = Number(result[5]);

  maxX = x + width > maxX ? x + width : maxX;
  maxY = y + height > maxY ? x + height : maxY;

  return {
    id,
    x,
    y,
    width,
    height
  };
});

const fabric = {};

claims.forEach(claim => {
  for (var x = claim.x; x < claim.x + claim.width; x++) {
    for (var y = claim.y; y < claim.y + claim.height; y++) {
      fabric[`${x},${y}`] = (fabric[`${x},${y}`] || 0) + 1;
    }
  }
});

const validClaim = claims.find(claim => {
  let valid = true;
  for (var x = claim.x; x < claim.x + claim.width; x++) {
    for (var y = claim.y; y < claim.y + claim.height; y++) {
      if (valid) {
        valid = fabric[`${x},${y}`] == 1;
      }
    }
  }
  return valid;
});

console.log(validClaim.id);
