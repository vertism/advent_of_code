package day4;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import utils.Utils;

public class Day4 {
  public static void main(String[] args) {
    String filename = "./2020/Day4/input";

    List<String> lines = Utils.fileToArray(filename);
    Day4 day4 = new Day4(lines);
    // day4.runPart1();
    day4.runPart2();
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

  public void runPart2() {
    List<String> pairs = new ArrayList<>();
    List<ValidDocument> documents = new ArrayList<>();

    for (String line : this.values) {
      if (line.length() == 0) {
        documents.add(new ValidDocument(pairs));
        pairs = new ArrayList<String>();
        continue;
      }

      for (String val : line.split(" ")) {
        pairs.add(val.trim());
      }
    }

    documents.add(new ValidDocument(pairs));

    int valid = 0;

    for (ValidDocument doc : documents) {
      if (doc.valid()) {
        valid++;
      }
    }

    System.out.println(valid);
  }

  class Document {
    List<String> keys;
    List<String> values;

    Document() {
    }

    Document(List<String> pairs) {
      this.keys = new ArrayList<>();
      this.values = new ArrayList<>();

      for (String pair : pairs) {
        String[] kv = pair.split(":");
        this.values.add(kv[1]);
        this.keys.add(kv[0]);
      }
    }

    public Boolean valid() {
      return this.keys.contains("byr") && this.keys.contains("iyr") && this.keys.contains("eyr")
          && this.keys.contains("hgt") && this.keys.contains("hcl") && this.keys.contains("ecl")
          && this.keys.contains("pid");
    }
  }

  class ValidDocument extends Document {
    ValidDocument(List<String> pairs) {
      super(pairs);
    }

    public Boolean valid() {
      return super.valid() && this.validBirthYear() && this.validIssueYear() && this.validExpirationYear()
          && this.validHeight() && this.validHairColour() && this.validEyeColour() && this.validPassportId();
    }

    private Boolean validBirthYear() {
      int index = this.keys.indexOf("byr");
      if (index == -1) {
        return false;
      }

      String year = this.values.get(index);
      if (year.length() != 4) {
        return false;
      }

      int iYear = Integer.parseInt(year);
      return iYear >= 1920 && iYear <= 2002;
    }

    private Boolean validIssueYear() {
      int index = this.keys.indexOf("iyr");
      if (index == -1) {
        return false;
      }

      String year = this.values.get(index);
      if (year.length() != 4) {
        return false;
      }

      int iYear = Integer.parseInt(year);
      return iYear >= 2010 && iYear <= 2020;
    }

    private Boolean validExpirationYear() {
      int index = this.keys.indexOf("eyr");
      if (index == -1) {
        return false;
      }

      String year = this.values.get(index);
      if (year.length() != 4) {
        return false;
      }

      int iYear = Integer.parseInt(year);
      return iYear >= 2020 && iYear <= 2030;
    }

    private Boolean validHeight() {
      int index = this.keys.indexOf("hgt");
      if (index == -1) {
        return false;
      }

      String height = this.values.get(index);

      String pattern = "^(\\d+)(cm|in)$";
      Pattern r = Pattern.compile(pattern);
      Matcher m = r.matcher(height);

      if (!m.find()) {
        return false;
      }

      int val = Integer.parseInt(m.group(1));

      if (m.group(2).equals("cm")) {
        return val >= 150 && val <= 193;
      } else {
        return val >= 59 && val <= 76;
      }
    }

    private Boolean validHairColour() {
      int index = this.keys.indexOf("hcl");
      if (index == -1) {
        return false;
      }

      String hair = this.values.get(index);

      String pattern = "#[0-9a-f]{6}";
      Pattern r = Pattern.compile(pattern);
      Matcher m = r.matcher(hair);

      return m.find();
    }

    private Boolean validEyeColour() {
      int index = this.keys.indexOf("ecl");
      if (index == -1) {
        return false;
      }

      String eye = this.values.get(index);

      String pattern = "^amb|blu|brn|gry|grn|hzl|oth$";
      Pattern r = Pattern.compile(pattern);
      Matcher m = r.matcher(eye);

      return m.find();
    }

    private Boolean validPassportId() {
      int index = this.keys.indexOf("pid");
      if (index == -1) {
        return false;
      }

      String eye = this.values.get(index);

      String pattern = "^\\d{9}$";
      Pattern r = Pattern.compile(pattern);
      Matcher m = r.matcher(eye);

      return m.find();
    }
  }
}
