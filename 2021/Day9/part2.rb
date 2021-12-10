class Day9

  attr_accessor :height_map

  def run
    @input = File.open('input').readlines.map(&:strip)
    low_points = []
    basin_sizes = []

    @height_map = @input.map do |line|
      line.chars.map(&:to_i)
    end

    height_map.each_with_index do |row, x|
      row.each_with_index do |spot, y|
        if is_low?(x, y, spot)
          low_points << [x,y]
        end
      end
    end

    low_points.each do |low|
      map = Array.new(@input.size) { Array.new(@input.first.size, '') }
      x, y = low

      map[x][y] = 1
      left(x, y, map)
      right(x, y, map)
      up(x, y, map)
      down(x, y, map)

      basin_sizes << map.sum { |line| line.select { |item| item == 1 }.count}
    end

    p basin_sizes.sort.reverse[0..2].inject(&:*)
  end

  def left(x, y, map)
    value = nil
    i = 1
    while value != 9 && y-i >= 0 && map[x][y-i] != 1
      value = height_map[x][y-i]
      if value != 9
        map[x][y-i] = 1
        up(x, y-i, map)
        down(x, y-i, map)
        i += 1
      end
    end
  end

  def right(x, y, map)
    value = nil
    i = 1
    while value != 9 && y+i < @input[0].size && map[x][y+i] != 1
      value = height_map[x][y+i]
      if value != 9
        map[x][y+i] = 1
        up(x, y+i, map)
        down(x, y+i, map)
        i += 1
      end
    end
  end

  def up(x, y, map)
    value = nil
    i = 1
    while value != 9 && x-i >= 0 && map[x-i][y] != 1
      value = height_map[x-i][y]
      if value != 9
        map[x-i][y] = 1
        left(x-i, y, map)
        right(x-i, y, map)
        i += 1
      end
    end
  end

  def down(x, y, map)
    value = nil
    i = 1
    while value != 9 && x+i < map.size && map[x+i][y] != 1
      value = height_map[x+i][y]
      if value != 9
        map[x+i][y] = 1
        left(x+i, y, map)
        right(x+i, y, map)
        i += 1
      end
    end
  end

  def is_low?(x, y, n)
    if y > 0
      up = height_map[x][y-1]
    else
      up = 10
    end

    down = height_map[x][y+1] || 10

    if x > 0
      left = height_map[x-1][y]
    else
      left = 10
    end

    if height_map.size > x + 1
      right = height_map[x+1][y]
    else
      right = 10
    end

    up > n && down > n && left > n && right > n
  end

end

Day9.new.run
