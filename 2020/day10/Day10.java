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
    day10.runPart1();
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
      System.out.println(i);
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
}
