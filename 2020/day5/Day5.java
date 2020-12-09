package day5;

import java.util.List;

import utils.Utils;

public class Day5 {
  public static void main(String[] args) {
    String filename = "./2020/Day5/input";

    List<String> lines = Utils.fileToArray(filename);
    Day5 day5 = new Day5(lines);
    day5.runPart1();
  }

  List<String> values;

  Day5(List<String> values) {
    this.values = values;
  }

  public void runPart1() {
    int maxCode = 0;

    for (String line : this.values) {
      int row = 0;
      int col = 0;

      String[] letters = line.split("");
      for (int i = 0; i < letters.length - 3; i++) {
        String letter = letters[i];
        if (letter.equals("B")) {
          int part = 128 / (int) Math.pow(2, i + 1);
          row += part;
        }
      }

      for (int i = 7; i < letters.length; i++) {
        String letter = letters[i];
        if (letter.equals("R")) {
          int part = 8 / (int) Math.pow(2, i - 6);
          col += part;
        }
      }

      int code = (row * 8) + col;

      if (code > maxCode) {
        maxCode = code;
      }
    }

    System.out.println(maxCode);
  }
}
