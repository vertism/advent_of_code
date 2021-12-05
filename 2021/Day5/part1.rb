#!/usr/bin/env ruby

file = 'input'
input = File.open(file).readlines.map(&:strip)

no = file == 'test' ? 10 : 1000

map = Array.new(no) { Array.new(no, 0) }

input.each do |segment|
  coord1, coord2 = segment.split(' -> ')
  x1, y1 = coord1.split(',').map(&:to_i)
  x2, y2 = coord2.split(',').map(&:to_i)

  if x1 == x2
    min, max = [y1, y2].sort
    min.upto(max).each do |point|
      map[point][x1] += 1
    end
  elsif y1 == y2
    min, max = [x1, x2].sort
    min.upto(max).each do |point|
      map[y1][point] += 1
    end
  else
    if x1 < x2
      x1.upto(x2).each_with_index do |pointx, i|
        if y1 < y2
          map[y1 + i][pointx] += 1
        else
          map[y1 - i][pointx] += 1
        end
      end
    else
      x1.downto(x2).each_with_index do |pointx, i|
        if y1 < y2
          map[y1 + i][pointx] += 1
        else
          map[y1 - i][pointx] += 1
        end
      end
    end
  end
end

total = 0

map.each do |row|
  row.each do |point|
    if point > 1
      total += 1
    end
  end
end

p total
