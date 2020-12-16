package day12;

import java.util.List;

import utils.Utils;

public class Day12 {
  public static void main(String[] args) {
    String filename = "./2020/Day12/input";

    List<String> lines = Utils.fileToArray(filename);
    Day12 day12 = new Day12(lines);
    // day12.runPart1();
    day12.runPart2();
  }

  List<String> values;
  int currentDirection, x, y, shipX, shipY;
  String[] directions;

  Day12(List<String> values) {
    this.values = values;
    this.currentDirection = 0;
    this.x = 0;
    this.y = 0;
    this.directions = new String[] { "E", "S", "W", "N" };
  }

  public void runPart1() {
    for (String cmd : this.values) {
      String direction = cmd.substring(0, 1);
      int steps = Integer.parseInt(cmd.substring(1, cmd.length()));
      move(direction, steps);
    }

    System.out.println(Math.abs(x) + Math.abs(y));
  }

  public void runPart2() {
    this.shipX = 0;
    this.shipY = 0;
    this.x = 10;
    this.y = 1;
    for (String cmd : this.values) {
      String direction = cmd.substring(0, 1);
      int steps = Integer.parseInt(cmd.substring(1, cmd.length()));
      moveShip(direction, steps);
    }

    System.out.println(Math.abs(shipX) + Math.abs(shipY));
  }

  private void moveShip(String direction, int steps) {
    switch (direction) {
      case "N":
        this.y += steps;
        break;
      case "S":
        this.y -= steps;
        break;
      case "E":
        this.x += steps;
        break;
      case "W":
        this.x -= steps;
        break;
      case "L":
        steps /= 90;
        for (int i = 0; i < steps; i++) {
          int tempX = this.x;
          this.x = -this.y;
          this.y = tempX;
        }
        break;
      case "R":
        steps /= 90;
        for (int i = 0; i < steps; i++) {
          int tempX = this.x;
          this.x = this.y;
          this.y = -tempX;
        }
        break;
      case "F":
        this.shipX += this.x * steps;
        this.shipY += this.y * steps;
        break;
    }
  }

  private void move(String direction, int steps) {
    switch (direction) {
      case "N":
        this.y += steps;
        break;
      case "S":
        this.y -= steps;
        break;
      case "E":
        this.x += steps;
        break;
      case "W":
        this.x -= steps;
        break;
      case "L":
        steps /= 90;
        this.currentDirection -= steps;
        break;
      case "R":
        steps /= 90;
        this.currentDirection += steps;
        break;
      case "F":
        move(getDirection(), steps);
        break;
    }
  }

  private String getDirection() {
    int index = this.currentDirection % 4;
    if (index < 0) {
      index += 4;
    }

    return this.directions[index];
  }
}
