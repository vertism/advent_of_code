package day3;

import java.util.List;

import utils.Utils;

public class Day3 {
  public static void main(String[] args) {
    String filename = "./2020/Day3/input";

    List<String> lines = Utils.fileToArray(filename);
    Day3 day3 = new Day3(lines);
    // day3.runPart1();
    day3.runPart2();
  }

  List<String> values;

  Day3(List<String> values) {
    this.values = values;
  }

  public void runPart1() {
    int width = 31;
    int col = 0;
    Boolean firstRow = true;
    int trees = 0;

    for (String val : this.values) {
      if (firstRow) {
        firstRow = false;
        continue;
      }

      col = (col + 3) % width;
      if (val.substring(col, col + 1).equals("#")) {
        trees++;
      }
    }

    System.out.println(trees);
  }

  public void runPart2() {
    int[] slopeRight = { 1, 3, 5, 7, 1 };
    int[] slopeDown = { 1, 1, 1, 1, 2 };
    int[] trees = { 0, 0, 0, 0, 0 };

    for (int i = 0; i < slopeRight.length; i++) {
      int right = slopeRight[i];
      int down = slopeDown[i];

      int col = 0;
      int row = 0;

      for (String val : this.values) {
        if (row == 0 || row % down != 0) {
          row++;
          continue;
        }

        row++;
        col = (col + right) % val.length();

        if (val.substring(col, col + 1).equals("#")) {
          int current = trees[i];
          trees[i] = current + 1;
        }
      }
    }

    long totalTrees = 0;

    for (long val : trees) {

      if (totalTrees == 0) {
        totalTrees = val;
      } else {
        totalTrees *= val;
      }
    }

    System.out.println(totalTrees);
  }
}
