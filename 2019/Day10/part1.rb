#!/usr/bin/env ruby

file_name = "test5"
locations = []
input = File.open(file_name).readlines.map{|i| i.strip}
input.each do |row|
  locations << row.chars.map { |char| char == "#" ? true : nil }
end

asteriods = {}

def visible_to(x:, y:, locations:)
  count = 0
  locations.each_with_index do |row, i|
    row.each_with_index do |point, j|
      next unless point
      next if (j == x && i == y)

      if x == j
        next if ([y, i].min + 1).upto([y, i].max - 1).any?{ |val| locations[val][x] }
      end

      if y == i
        next if ([x, j].min + 1).upto([x, j].max - 1).any?{ |val| locations[y][val] }
      end

      if (j - x).abs == (i - y).abs
        next if 1.upto((j - x).abs - 1).any? { |z| locations[[y, i].min + z][[x, j].min + z] }
      end

      next if 2.upto(locations.size / 2).any? do |m|
        found = false
        x_diff = (j - x).abs
        y_diff = (i - y).abs
        if x_diff % m == 0 && y_diff % m == 0
          in_bounds = true
          counter = 0
          x_factor = (j - x).abs / m
          y_factor = (i - y).abs / m

          while in_bounds
            if locations[[i,y].min + (y_factor * counter)][[j,x].min + (x_factor * counter)]
              in_bounds = false
              found = true
            else
              counter += 1
              if [i,y].min + (y_factor * counter) >= y_diff || [j,x].min + (x_factor * counter) >= x_diff
                in_bounds = false
              end
            end
          end
        end
        found
      end

      count += 1
    end
  end

  count
end

locations.each_with_index do |row, i|
  row.each_with_index do |point, j|
    next unless point

    asteriods["#{j},#{i}"] = visible_to(x: j, y: i, locations: locations)
  end
end

p asteriods.values.max

