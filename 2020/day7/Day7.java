package day7;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import utils.Utils;

public class Day7 {
  public static void main(String[] args) {
    String filename = "./2020/Day7/input";

    List<String> lines = Utils.fileToArray(filename);
    Day7 day7 = new Day7(lines);
    // day7.runPart1();
    day7.runPart2();
  }

  List<String> values;

  Day7(List<String> values) {
    this.values = values;
  }

  public void runPart1() {
    Boolean bagsIncreasing = true;
    Set<String> bags = new HashSet<>();
    Set<String> moreBags = new HashSet<>();
    bags.addAll(this.bagsContaining("shiny gold"));

    while (bagsIncreasing) {
      int currentCount = bags.size();
      moreBags = new HashSet<>();
      for (String bag : bags) {
        moreBags.addAll(bagsContaining(bag.trim()));
      }
      bags.addAll(moreBags);
      if (bags.size() == currentCount) {
        bagsIncreasing = false;
      }
    }

    System.out.println(bags.size());
  }

  public void runPart2() {
    System.out.println(this.required("shiny gold") - 1);
  }

  private List<String> bagsContaining(String type) {
    List<String> bags = new ArrayList<>();
    for (String line : this.values) {
      String[] parts = line.split("contain");
      if (parts[1].contains(type)) {
        String bag = parts[0].replace("bags", "");
        bags.add(bag);
      }
    }

    return bags;
  }

  private int required(String type) {
    int total = 1;

    for (String line : this.values) {
      String[] parts = line.split("contain");
      if (parts[0].contains(type)) {
        String[] bags = parts[1].split(",");
        for (String bag : bags) {
          String digit = bag.trim().substring(0, 1);
          try {
            int num = Integer.parseInt(digit);
            String description = bag.trim().substring(2, bag.length() - 4);
            total += num * this.required(description);
          } catch (NumberFormatException e) {
          }
        }
      }
    }

    return total;
  }
}
