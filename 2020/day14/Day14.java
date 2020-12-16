package day14;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import utils.Utils;

public class Day14 {
  public static void main(String[] args) {
    String filename = "./2020/Day14/input";

    List<String> lines = Utils.fileToArray(filename);
    Day14 day14 = new Day14(lines);
    day14.runPart1();
  }

  List<String> values;
  String mask;

  Day14(List<String> values) {
    this.values = values;
  }

  public void runPart1() {
    Map<String, Long> allValues = new HashMap<>();
    String mask = "";
    String loc;
    String bin;
    for (String line : this.values) {
      String[] parts = line.split(" = ");
      if (parts[0].equals("mask")) {
        mask = parts[1];
      } else {
        loc = parts[0].substring(1, parts[0].length() - 1);
        bin = String.format("%36s", Long.toBinaryString(Long.parseLong(parts[1]))).replace(" ", "0");
        allValues.put(loc, convert(bin, mask));
      }
    }

    long total = 0;

    for (long val : allValues.values()) {
      total += val;
    }

    System.out.println(total);
  }

  private long convert(String bin, String mask) {
    String converted = "";
    String[] places = bin.split("");

    for (int i = 0; i < places.length; i++) {
      String ch = mask.substring(i, i + 1);
      if (ch.equals("X")) {
        converted += places[i];
      } else {
        converted += ch;
      }
    }

    return Long.parseLong(converted, 2);
  }
}
