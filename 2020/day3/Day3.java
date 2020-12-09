package day3;

import java.util.List;

import utils.Utils;

public class Day3 {
  public static void main(String[] args) {
    String filename = "./2020/Day3/input";

    List<String> lines = Utils.fileToArray(filename);
    Day3 day3 = new Day3(lines);
    day3.runPart1();
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
}
