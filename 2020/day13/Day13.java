package day13;

import java.util.List;

import utils.Utils;

public class Day13 {
  public static void main(String[] args) {
    String filename = "./2020/Day13/input";

    List<String> lines = Utils.fileToArray(filename);
    Day13 day13 = new Day13(lines);
    // day13.runPart1();
    day13.runPart2();
  }

  String[] values;
  int depart;

  Day13(List<String> values) {
    this.depart = Integer.parseInt(values.get(0));
    this.values = values.get(1).split(",");
  }

  public void runPart1() {
    int best = Integer.MAX_VALUE;
    int busId = 0;
    for (String id : this.values) {
      if (id.equals("x")) {
        continue;
      }
      int freq = Integer.parseInt(id);
      int wait = freq - (this.depart % freq);
      if (wait < best) {
        best = wait;
        busId = freq;
      }
    }

    System.out.println(busId * best);
  }

  public void runPart2() {
    int[] vals = new int[this.values.length];
    for (int j = 0; j < this.values.length; j++) {
      if (this.values[j].equals("x")) {
        vals[j] = 0;
      } else {
        vals[j] = Integer.parseInt(this.values[j]);
      }
    }

    Boolean solved = false;
    long time = 0;
    long multiplier = vals[0];
    int includedId = 0;

    while (!solved) {
      solved = true;

      time += multiplier;

      for (int x = includedId + 1; x < vals.length; x++) {
        int freq = vals[x];
        if (freq == 0) {
          continue;
        }

        if ((time + x) % freq == 0) {
          includedId = x;
          multiplier *= freq;
        } else {
          solved = false;
          break;
        }
      }
    }

    System.out.println(time);
  }
}
