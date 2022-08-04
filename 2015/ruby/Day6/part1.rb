#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

grid = Array.new(1000){ |i| Array.new(1000){ |i| "off" } }

input.each do |ins|
  words = ins.split
  if words[0] == "toggle"
    type = "toggle"
    from_x, from_y = words[1].split(',').map(&:to_i)
    to_x, to_y = words[3].split(',').map(&:to_i)
  else
    type = words[1]
    from_x, from_y = words[2].split(',').map(&:to_i)
    to_x, to_y = words[4].split(',').map(&:to_i)
  end

  from_x.upto(to_x).each do |x|
    from_y.upto(to_y).each do |y|
      if type == "toggle"
        new_value = grid[x][y] == "on" ? "off" : "on"
        grid[x][y] = new_value
      else
        grid[x][y] = type
      end
    end
  end
end

count_lit = 0
grid.each do |row|
  row.each do |col|
    if col == "on"
      count_lit += 1
    end
  end
end

p count_lit
