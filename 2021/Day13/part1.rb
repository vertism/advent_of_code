input = File.open('input').readlines.map(&:strip)

xs = []
ys = []

input.map do |line|
  y, x = line.split(',')
  xs << x.to_i
  ys << y.to_i
end

cave_map = Array.new(xs.max + 1) { Array.new(ys.max + 1, " ") }

input.each do |line|
  next if line.size == 0

  if line.start_with?("fold")
    if index = line.index("y")
      fold_direction = "y"
      fold_location = line[index+2..-1].to_i
    elsif index = line.index("x")
      fold_direction = "x"
      fold_location = line[index+2..-1].to_i
    end

    if fold_direction == "y"
      cave_map.each_with_index do |row, y|
        next if y < fold_location

        if y == fold_location
          row.each_with_index do |_, x|
            cave_map[y][x] = " "
          end
          next
        end

        row.each_with_index do |point, x|
          if point == "#"
            cave_map[y][x] = " "
            mirror_location = fold_location - (y - fold_location)
            cave_map[mirror_location][x] = "#"
          end
        end
      end

      cave_map.delete_if.with_index { |row, y| y >= fold_location }
    else
      cave_map.each_with_index do |row, y|
        row.each_with_index do |point, x|
          next if x < fold_location

          if x == fold_location
            cave_map[y][x] = " "
            next
          end

          if point == "#"
            cave_map[y][x] = " "
            mirror_location = fold_location - (x - fold_location)
            cave_map[y][mirror_location] = "#"
          end
        end
      end

      cave_map.each_with_index do |row, y|
        row.delete_if.with_index { |_, x| x >= fold_location }
      end
    end
    break
  else
    x, y = line.split(',')
    cave_map[y.to_i][x.to_i] = "#"
  end
end

total = cave_map.sum do |row|
  row.count{ |i| i == "#" }
end

p total
