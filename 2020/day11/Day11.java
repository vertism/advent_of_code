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
    // day11.runPart1();
    day11.runPart2();
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

  public void runPart2() {
    Boolean changes = true;

    while (changes) {
      int k, l;
      changes = false;
      String[][] updated = new String[this.rows][this.cols];
      for (int i = 0; i < this.rows; i++) {
        for (int j = 0; j < this.cols; j++) {
          String seat = this.values[i][j];
          updated[i][j] = seat;

          // Check for occupied seat in sight
          if (seat.equals("L")) {
            Boolean checked = false;
            Boolean occupiedSeat = false;

            // North
            for (k = i - 1; k >= 0; k--) {
              if (checked) {
                break;
              }
              String otherSeat = this.values[k][j];
              if (otherSeat.equals("#")) {
                occupiedSeat = true;
                checked = true;
              } else if (otherSeat.equals("L")) {
                checked = true;
              }
            }

            // East
            if (!occupiedSeat) {
              checked = false;
              for (l = j + 1; l < this.cols; l++) {
                if (checked) {
                  break;
                }
                String otherSeat = this.values[i][l];
                if (otherSeat.equals("#")) {
                  occupiedSeat = true;
                  checked = true;
                } else if (otherSeat.equals("L")) {
                  checked = true;
                }
              }
            }

            // South
            if (!occupiedSeat) {
              checked = false;
              for (k = i + 1; k < this.rows; k++) {
                if (checked) {
                  break;
                }
                String otherSeat = this.values[k][j];
                if (otherSeat.equals("#")) {
                  occupiedSeat = true;
                  checked = true;
                } else if (otherSeat.equals("L")) {
                  checked = true;
                }
              }
            }

            // West
            if (!occupiedSeat) {
              checked = false;
              for (l = j - 1; l >= 0; l--) {
                if (checked) {
                  break;
                }
                String otherSeat = this.values[i][l];
                if (otherSeat.equals("#")) {
                  occupiedSeat = true;
                  checked = true;
                } else if (otherSeat.equals("L")) {
                  checked = true;
                }
              }
            }

            // North East
            if (!occupiedSeat) {
              checked = false;
              k = i - 1;
              l = j + 1;
              while (k >= 0 && l < this.cols && !checked) {
                String otherSeat = this.values[k][l];
                if (otherSeat.equals("#")) {
                  occupiedSeat = true;
                  checked = true;
                } else if (otherSeat.equals("L")) {
                  checked = true;
                }
                k--;
                l++;
              }
            }

            // South East
            if (!occupiedSeat) {
              checked = false;
              k = i + 1;
              l = j + 1;
              while (k < this.rows && l < this.cols && !checked) {
                String otherSeat = this.values[k][l];
                if (otherSeat.equals("#")) {
                  occupiedSeat = true;
                  checked = true;
                } else if (otherSeat.equals("L")) {
                  checked = true;
                }
                k++;
                l++;
              }
            }

            // South West
            if (!occupiedSeat) {
              checked = false;
              k = i + 1;
              l = j - 1;
              while (k < this.rows && l >= 0 && !checked) {
                String otherSeat = this.values[k][l];
                if (otherSeat.equals("#")) {
                  occupiedSeat = true;
                  checked = true;
                } else if (otherSeat.equals("L")) {
                  checked = true;
                }
                k++;
                l--;
              }
            }

            // North West
            if (!occupiedSeat) {
              checked = false;
              k = i - 1;
              l = j - 1;
              while (k >= 0 && l >= 0 && !checked) {
                String otherSeat = this.values[k][l];
                if (otherSeat.equals("#")) {
                  occupiedSeat = true;
                  checked = true;
                } else if (otherSeat.equals("L")) {
                  checked = true;
                }
                k--;
                l--;
              }
            }

            if (!occupiedSeat) {
              changes = true;
              updated[i][j] = "#";
            }
          }

          // Check for 5+ seats occupied in sight
          if (seat.equals("#")) {
            int occupiedSeats = 0;
            Boolean checked = false;

            // North
            for (k = i - 1; k >= 0; k--) {
              if (checked) {
                break;
              }
              String otherSeat = this.values[k][j];
              if (otherSeat.equals("#")) {
                occupiedSeats++;
                checked = true;
              } else if (otherSeat.equals("L")) {
                checked = true;
              }
            }

            // East
            checked = false;
            for (l = j + 1; l < this.cols; l++) {
              if (checked) {
                break;
              }
              String otherSeat = this.values[i][l];
              if (otherSeat.equals("#")) {
                occupiedSeats++;
                checked = true;
              } else if (otherSeat.equals("L")) {
                checked = true;
              }
            }

            // South
            checked = false;
            for (k = i + 1; k < this.rows; k++) {
              if (checked) {
                break;
              }
              String otherSeat = this.values[k][j];
              if (otherSeat.equals("#")) {
                occupiedSeats++;
                checked = true;
              } else if (otherSeat.equals("L")) {
                checked = true;
              }
            }

            // West
            checked = false;
            for (l = j - 1; l >= 0; l--) {
              if (checked) {
                break;
              }
              String otherSeat = this.values[i][l];
              if (otherSeat.equals("#")) {
                occupiedSeats++;
                checked = true;
              } else if (otherSeat.equals("L")) {
                checked = true;
              }
            }

            // North East
            checked = false;
            k = i - 1;
            l = j + 1;
            while (k >= 0 && l < this.cols && !checked) {
              String otherSeat = this.values[k][l];
              if (otherSeat.equals("#")) {
                occupiedSeats++;
                checked = true;
              } else if (otherSeat.equals("L")) {
                checked = true;
              }
              k--;
              l++;
            }

            // South East
            checked = false;
            k = i + 1;
            l = j + 1;
            while (k < this.rows && l < this.cols && !checked) {
              String otherSeat = this.values[k][l];
              if (otherSeat.equals("#")) {
                occupiedSeats++;
                checked = true;
              } else if (otherSeat.equals("L")) {
                checked = true;
              }
              k++;
              l++;
            }

            // South West
            checked = false;
            k = i + 1;
            l = j - 1;
            while (k < this.rows && l >= 0 && !checked) {
              String otherSeat = this.values[k][l];
              if (otherSeat.equals("#")) {
                occupiedSeats++;
                checked = true;
              } else if (otherSeat.equals("L")) {
                checked = true;
              }
              k++;
              l--;
            }

            // North West
            checked = false;
            k = i - 1;
            l = j - 1;
            while (k >= 0 && l >= 0 && !checked) {
              String otherSeat = this.values[k][l];
              if (otherSeat.equals("#")) {
                occupiedSeats++;
                checked = true;
              } else if (otherSeat.equals("L")) {
                checked = true;
              }
              k--;
              l--;
            }

            if (occupiedSeats >= 5) {
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
