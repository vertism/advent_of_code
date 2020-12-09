package day4;

import java.util.ArrayList;
import java.util.List;

import utils.Utils;

public class Day4 {
  public static void main(String[] args) {
    String filename = "./2020/Day4/input";

    List<String> lines = Utils.fileToArray(filename);
    Day4 day4 = new Day4(lines);
    day4.runPart1();
  }

  List<String> values;

  Day4(List<String> values) {
    this.values = values;
  }

  public void runPart1() {
    List<String> pairs = new ArrayList<>();
    List<Document> documents = new ArrayList<>();

    for (String line : this.values) {
      if (line.length() == 0) {
        documents.add(new Document(pairs));
        pairs = new ArrayList<String>();
        continue;
      }

      for (String val : line.split(" ")) {
        pairs.add(val.trim());
      }
    }

    documents.add(new Document(pairs));

    int valid = 0;

    for (Document doc : documents) {
      if (doc.valid()) {
        valid++;
      }
    }

    System.out.println(valid);
  }

  class Document {
    List<String> keys;

    Document(List<String> pairs) {
      this.keys = new ArrayList<>();

      for (String pair : pairs) {
        String[] kv = pair.split(":");
        this.keys.add(kv[0]);
      }
    }

    public Boolean valid() {
      return this.keys.contains("byr") && this.keys.contains("iyr") && this.keys.contains("eyr")
          && this.keys.contains("hgt") && this.keys.contains("hcl") && this.keys.contains("ecl")
          && this.keys.contains("pid");
    }
  }
}
