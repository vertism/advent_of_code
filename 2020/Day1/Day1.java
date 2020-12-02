package day1;

import java.util.List;

import utils.Utils;

public class Day1 {
  public static void main(String[] args) {
    Day1 day1;
    String filename = "./2020/Day1/input";

    List<String> lines = Utils.fileToArray(filename);
    day1 = new Day1(lines);
    // day1.runPart1();
    day1.runPart2();
  }

  List<String> values;

  Day1(List<String> values) {
    this.values = values;
  }

  public void runPart1() {
    int result = 0;

    for (String x : this.values) {
      if (result > 0) {
        break;
      }
      int iX = Integer.parseInt(x);
      for (String y : this.values) {
        int iY = Integer.parseInt(y);
        if (iX + iY == 2020) {
          result = iX * iY;
        }
      }
    }

    System.out.println(result);
  }

  public void runPart2() {
    int result = 0;

    for (String x : this.values) {
      if (result > 0) {
        break;
      }
      int iX = Integer.parseInt(x);
      for (String y : this.values) {
        int iY = Integer.parseInt(y);
        for (String z : this.values) {
          int iZ = Integer.parseInt(z);
          if (iX + iY + iZ == 2020) {
            result = iX * iY * iZ;
          }
        }
      }
    }

    System.out.println(result);
  }
}
