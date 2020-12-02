package day2;

import java.util.List;

import utils.Utils;

public class Day2 {
  public static void main(String[] args) {
    String filename = "./2020/Day2/input";

    List<String> lines = Utils.fileToArray(filename);
    Day2 day2 = new Day2(lines);
    // day2.runPart1();
    day2.runPart2();
  }

  List<String> values;

  Day2(List<String> values) {
    this.values = values;
  }

  public void runPart1() {
    int valid = 0;

    for (String val : this.values) {
      String[] parts = val.split(":");
      String policy = parts[0];
      String password = parts[1];

      String[] policyParts = policy.split(" ");
      char letter = policyParts[1].charAt(0);
      String[] allowedParts = policyParts[0].split("-");
      int min = Integer.parseInt(allowedParts[0]);
      int max = Integer.parseInt(allowedParts[1]);

      int total = 0;
      for (char character : password.toCharArray()) {
        if (character == letter) {
          total++;
        }
      }

      if (total >= min && total <= max) {
        valid++;
      }
    }

    System.out.println(valid);
  }

  public void runPart2() {
    int valid = 0;

    for (String val : this.values) {
      String[] parts = val.split(":");
      String policy = parts[0];
      String password = parts[1].trim();

      String[] policyParts = policy.split(" ");
      char letter = policyParts[1].charAt(0);
      String[] allowedParts = policyParts[0].split("-");
      int first = Integer.parseInt(allowedParts[0]);
      int second = Integer.parseInt(allowedParts[1]);

      int total = 0;

      if (password.charAt(first - 1) == letter) {
        total++;
      }

      if (password.charAt(second - 1) == letter) {
        total++;
      }

      if (total == 1) {
        valid++;
      } else {
        System.out.println(total);
        System.out.println(val);
        System.out.println(password);
        System.out.println(password.charAt(first - 1));
        System.out.println(password.charAt(second - 1));
        System.out.println("------------------");

      }
    }

    System.out.println(valid);
  }
}
