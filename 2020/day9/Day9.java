package day9;

import java.util.List;

import utils.Utils;

public class Day9 {
  public static void main(String[] args) {
    String filename = "./2020/Day9/input";

    List<String> lines = Utils.fileToArray(filename);
    Day9 day9 = new Day9(lines, 25);
    int num = day9.runPart1();
    day9.runPart2(num);
  }

  List<String> values;
  int preamble;

  Day9(List<String> values, int preamble) {
    this.values = values;
    this.preamble = preamble;
  }

  public int runPart1() {
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
          if (x + y == number) {
            found = true;
            break;
          }
        }
      }

      if (!found) {
        System.out.println(number);
        return number;
      }
    }
    return -1;
  }

  public void runPart2(int num) {
    Boolean notFound = true;
    int start = 0;
    int end = 0;

    while (notFound && start <= this.values.size()) {
      int count = 0;

      for (int i = start; i < this.values.size(); i++) {
        int number = Integer.parseInt(this.values.get(i));
        count += number;

        if (count == num) {
          notFound = false;
          end = i;
          break;
        }

        if (count > num) {
          break;
        }
      }

      if (notFound) {
        start++;
      }
    }

    int min = Integer.MAX_VALUE;
    int max = 0;

    for (int i = start; i < end; i++) {
      int number = Integer.parseInt(this.values.get(i));
      if (number < min) {
        min = number;
      }

      if (number > max) {
        max = number;
      }
    }

    System.out.println(min + max);

  }
}
