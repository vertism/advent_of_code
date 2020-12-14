package day10;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import utils.Utils;

public class Day10 {
  public static void main(String[] args) {
    String filename = "./2020/Day10/input";

    List<String> lines = Utils.fileToArray(filename);
    Day10 day10 = new Day10(lines);
    // day10.runPart1();
    day10.runPart2();
  }

  List<Integer> values;

  Day10(List<String> values) {
    this.values = new ArrayList<>();
    for (String x : values) {
      int iX = Integer.parseInt(x);
      this.values.add(iX);
    }
    Collections.sort(this.values);
  }

  public void runPart1() {
    int count1 = 0;
    int count3 = 1;
    int previous = 0;
    for (int i : this.values) {
      int diff = i - previous;
      if (diff == 1) {
        count1++;
      } else if (diff == 3) {
        count3++;
      }
      previous = i;
    }

    System.out.println(count1 * count3);
  }

  public void runPart2() {
    long count = 1;
    int prev = 0;
    int run = 0;
    for (int i = 0; i < this.values.size(); i++) {
      int current = this.values.get(i);
      if (prev + 1 == current) {
        run++;
      } else {
        count *= getCount(run);
        run = 0;
      }
      prev = current;
    }

    count *= getCount(run);

    System.out.println(count);
  }

  private int getCount(int run) {
    switch (run) {
      case 2:
        return 2;
      case 3:
        return 4;
      case 4:
        return 7;
      default:
        return 1;
    }
  }
}
