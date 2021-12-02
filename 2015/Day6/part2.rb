#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

grid = Array.new(1000){ |i| Array.new(1000){ |i| 0 } }

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
      case type
      when "toggle"
        grid[x][y] += 2
      when "on"
        grid[x][y] += 1
      when "off"
        next if grid[x][y] == 0
        grid[x][y] -=1
      end
    end
  end
end

total = 0
grid.each do |row|
  row.each do |col|
    total += col
  end
end

p total
