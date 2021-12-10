class Day9

  attr_accessor :height_map

  def run
    input = File.open('input').readlines.map(&:strip)
    low_point_sum = 0

    @height_map = input.map do |line|
      line.chars.map(&:to_i)
    end

    height_map.each_with_index do |row, x|
      row.each_with_index do |spot, y|
        if is_low?(x, y, spot)
          low_point_sum += spot + 1
        end
      end
    end

    p low_point_sum
  end

  def is_low?(x, y, n)
    if y > 0
      up = height_map[x][y-1]
    else
      up = 1000
    end

    down = height_map[x][y+1] || 10000

    if x > 0
      left = height_map[x-1][y]
    else
      left = 1000
    end

    if height_map.size > x + 1
      right = height_map[x+1][y]
    else
      right = 1000
    end

    up > n && down > n && left > n && right > n
  end

end

Day9.new.run
