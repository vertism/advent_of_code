package utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class Utils {

  public static List<String> fileToArray(String path) {
    List<String> lines = null;
    Path filePath = Paths.get(path);

    try {
      lines = Files.readAllLines(filePath);
    } catch (IOException e) {
      e.printStackTrace();
    }

    return lines;
  }
}
