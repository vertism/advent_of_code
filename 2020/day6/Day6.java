package day6;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import utils.Utils;

public class Day6 {
  public static void main(String[] args) {
    String filename = "./2020/Day6/input";

    List<String> lines = Utils.fileToArray(filename);
    Day6 day6 = new Day6(lines);
    day6.runPart1();
  }

  List<String> values;

  Day6(List<String> values) {
    this.values = values;
  }

  public void runPart1() {
    int answers = 0;
    Set<String> yeses = new HashSet<>();

    for (String line : this.values) {
      if (line.length() == 0) {
        System.out.println(yeses.size());
        answers += yeses.size();
        yeses = new HashSet<>();
        continue;
      }

      String[] letters = line.trim().split("");
      for (String letter : letters) {
        yeses.add(letter);
      }
    }

    System.out.println(yeses.size());
    answers += yeses.size();

    System.out.println(answers);
  }
}
