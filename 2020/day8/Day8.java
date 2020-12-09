package day8;

import java.util.ArrayList;
import java.util.List;

import utils.Utils;

public class Day8 {
  public static void main(String[] args) {
    String filename = "./2020/Day8/input";

    List<String> lines = Utils.fileToArray(filename);
    Day8 day8 = new Day8(lines);
    // day8.runPart1();
    day8.runPart2();
  }

  List<String> values;

  Day8(List<String> values) {
    this.values = values;
  }

  public void runPart1() {
    int acc = 0;
    List<Integer> run = new ArrayList<>();

    for (int i = 0; i < this.values.size(); i++) {
      System.out.println(this.values.get(i));
      if (run.contains(i)) {
        break;
      }
      run.add(i);
      String[] instruction = this.values.get(i).split(" ");
      String sign = instruction[1].substring(0, 1);
      int num = Integer.parseInt(instruction[1].trim().substring(1, instruction[1].length()));
      switch (instruction[0]) {
        case "acc":
          if (sign.equals("+")) {
            acc += num;
          } else {
            acc -= num;
          }
          break;
        case "jmp":
          if (sign.equals("+")) {
            i += num - 1;
          } else {
            i -= num + 1;
          }
          break;
        case "nop":
          break;
      }
    }

    System.out.println(acc);
  }

  public void runPart2() {
    Boolean complete = false;
    int acc = 0;
    List<Integer> run = new ArrayList<>();
    int change = 0;

    while (!complete) {
      change += 1;
      acc = 0;
      run = new ArrayList<>();

      if (change > this.values.size()) {
        break;
      }

      for (int i = 0; i < this.values.size(); i++) {
        if (complete) {
          break;
        }
        if (run.contains(i)) {
          break;
        }
        run.add(i);
        String[] instruction = this.values.get(i).split(" ");
        String type = instruction[0];
        String sign = instruction[1].substring(0, 1);
        int num = Integer.parseInt(instruction[1].trim().substring(1, instruction[1].length()));

        if (i == change) {
          if (type.equals("nop")) {
            type = "jmp";
          }
          if (type.equals("jmp")) {
            type = "nop";
          }
        }

        switch (type) {
          case "FINAL":
            complete = true;
            break;
          case "acc":
            if (sign.equals("+")) {
              acc += num;
            } else {
              acc -= num;
            }
            break;
          case "jmp":
            if (sign.equals("+")) {
              i += num - 1;
            } else {
              i -= num + 1;
            }
            break;
          case "nop":
            break;
        }
      }
    }

    System.out.println(acc);
  }
}
