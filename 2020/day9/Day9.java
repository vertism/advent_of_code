package day9;

import java.util.List;

import utils.Utils;

public class Day9 {
  public static void main(String[] args) {
    String filename = "./2020/Day9/input";

    List<String> lines = Utils.fileToArray(filename);
    Day9 day9 = new Day9(lines, 25);
    day9.runPart1();
  }

  List<String> values;
  int preamble;

  Day9(List<String> values, int preamble) {
    this.values = values;
    this.preamble = preamble;
  }

  public void runPart1() {
    for (int i = this.preamble; i < this.values.size(); i++) {
      Boolean found = false;
      int number = Integer.parseInt(this.values.get(i));

      for (int j = i - this.preamble; j < i; j++) {
        if (found) {
          break;
        }

        for (int k = j + 1; k < i; k++) {
          int x = Integer.parseInt(this.values.get(j));
          int y = Integer.parseInt(this.values.get(k));
          // System.out.println(x);
          // System.out.println(y);
          if (x + y == number) {
            found = true;
            break;
          }
        }
      }

      if (!found) {
        System.out.println(number);
        break;
      }
    }
  }
}
