package day8;

import java.util.ArrayList;
import java.util.List;

import utils.Utils;

public class Day8 {
  public static void main(String[] args) {
    String filename = "./2020/Day8/input";

    List<String> lines = Utils.fileToArray(filename);
    Day8 day8 = new Day8(lines);
    day8.runPart1();
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
}
