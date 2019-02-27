const fs = require("fs");
const input = fs.readFileSync("Day4/input", "utf8");
const inputValues = input.split("\n").filter(l => l);

const re = /^\[([\d-]+ \d+:(\d+))\]( Guard #(\d+))?( falls asleep)?( wakes up)?/;
const logData = inputValues.map(line => {
  let result = re.exec(line);

  const timestamp = new Date(result[1]);
  const minute = result[2];
  const guard = result[4];
  const asleep = Boolean(result[5]);
  const awake = Boolean(result[6]);

  return {
    timestamp,
    minute,
    guard,
    asleep,
    awake
  };
});

logData.sort((a, b) => a.timestamp - b.timestamp);

let currentGuard;
let currentSleepMinute = 0;
const analysed = logData.reduce((acc, data) => {
  if (data.guard) {
    currentGuard = data.guard;
  }
  if (data.asleep) {
    currentSleepMinute = data.minute;
    if (!Object.keys(acc).includes(currentGuard)) {
      acc[currentGuard] = {};
    }
  }
  if (data.awake) {
    for (let m = currentSleepMinute; m < data.minute; m++) {
      const currentValue = acc[currentGuard][m] || 0;
      acc[currentGuard][m] = currentValue + 1;
    }
    currentSleepMinute = undefined;
  }
  return acc;
}, {});

let maxSleep = 0;
const mostAsleepGuard = Object.keys(analysed).reduce((acc, guard) => {
  const total = Math.max(...Object.values(analysed[guard]));
  if (total > maxSleep) {
    maxSleep = total;
    return guard;
  } else {
    return acc;
  }
}, "");

let maxMinutes = 0;

const mostAsleepMinute = Object.keys(analysed[mostAsleepGuard]).reduce(
  (acc, minute) => {
    if (analysed[mostAsleepGuard][minute] > maxMinutes) {
      maxMinutes = analysed[mostAsleepGuard][minute];
      return minute;
    } else {
      return acc;
    }
  },
  0
);

console.log(Number(mostAsleepGuard) * mostAsleepMinute);
