package day11;

import java.util.List;

import utils.Utils;

public class Day11 {
  public static void main(String[] args) {
    // String filename = "./2020/Day11/test";
    // List<String> lines = Utils.fileToArray(filename);
    // Day11 day11 = new Day11(lines, 10, 10);
    String filename = "./2020/Day11/input";
    List<String> lines = Utils.fileToArray(filename);
    Day11 day11 = new Day11(lines, 95, 91);
    day11.runPart1();
  }

  String[][] values;
  int rows;
  int cols;

  Day11(List<String> values, int rows, int cols) {
    this.rows = rows;
    this.cols = cols;
    this.values = new String[rows][cols];
    int x = 0;
    int y = 0;
    for (String row : values) {
      y = 0;
      for (String seat : row.split("")) {
        this.values[x][y] = seat;
        y++;
      }
      x++;
    }
  }

  public void runPart1() {
    Boolean changes = true;

    while (changes) {
      System.out.println("TRYING");
      changes = false;
      String[][] updated = new String[this.rows][this.cols];
      for (int i = 0; i < this.rows; i++) {
        for (int j = 0; j < this.cols; j++) {
          String seat = this.values[i][j];
          updated[i][j] = seat;

          if (seat.equals("L")) {
            // Check for occupied seat next to it
            Boolean occupiedSeat = false;
            for (int k = i - 1; k <= i + 1; k++) {
              for (int l = j - 1; l <= j + 1; l++) {
                if (k >= 0 && l >= 0 && k < this.rows && l < this.cols) {
                  String otherSeat = this.values[k][l];
                  if (otherSeat.equals("#")) {
                    occupiedSeat = true;
                  }
                }
              }
            }

            if (!occupiedSeat) {
              changes = true;
              updated[i][j] = "#";
            }
          }

          if (seat.equals("#")) {
            // Check for 4+ adjacent seats occupied
            int occupiedSeats = 0;
            for (int k = i - 1; k <= i + 1; k++) {
              for (int l = j - 1; l <= j + 1; l++) {
                if (k >= 0 && l >= 0 && k < this.rows && l < this.cols) {
                  if (k == i && l == j) {
                    continue;
                  }
                  String otherSeat = this.values[k][l];
                  if (otherSeat.equals("#")) {
                    occupiedSeats++;
                  }
                }
              }
            }
            if (occupiedSeats >= 4) {
              changes = true;
              updated[i][j] = "L";
            }
          }
        }
      }
      this.values = updated;
    }

    int count = 0;

    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        if (this.values[i][j] == "#") {
          count++;
        }
      }
    }

    System.out.println(count);
  }
}
