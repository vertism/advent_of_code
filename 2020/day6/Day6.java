package day6;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import utils.Utils;

public class Day6 {
  public static void main(String[] args) {
    String filename = "./2020/Day6/input";

    List<String> lines = Utils.fileToArray(filename);
    Day6 day6 = new Day6(lines);
    // day6.runPart1();
    day6.runPart2();
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
        answers += yeses.size();
        yeses = new HashSet<>();
        continue;
      }

      String[] letters = line.trim().split("");
      for (String letter : letters) {
        yeses.add(letter);
      }
    }

    answers += yeses.size();

    System.out.println(answers);
  }

  public void runPart2() {
    int answers = 0;
    List<String> current = new ArrayList<>();
    List<String> yeses = new ArrayList<>();
    Boolean processing = false;

    for (String line : this.values) {
      if (line.length() == 0) {
        processing = false;
        System.out.println(current.size());
        answers += current.size();
        continue;
      }

      String[] letters = line.trim().split("");

      if (processing) {
        yeses = new ArrayList<>();
        for (String letter : letters) {
          if (current.contains(letter)) {
            yeses.add(letter);
          }
        }
        current = yeses;
      } else {
        current = new ArrayList<>();
        for (String letter : letters) {
          current.add(letter);
        }
        processing = true;
      }
    }

    answers += yeses.size();

    System.out.println(answers);
  }
}
