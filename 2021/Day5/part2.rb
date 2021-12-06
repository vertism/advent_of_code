#!/usr/bin/env ruby

file = 'input'
input = File.open(file).readlines.map(&:strip)

no = file == 'test' ? 10 : 1000

diagram = Array.new(no) { Array.new(no, 0) }

input.each do |segment|
  coord1, coord2 = segment.split('->')
  x1, y1 = coord1.split(',').map(&:to_i)
  x2, y2 = coord2.split(',').map(&:to_i)

  if x1 == x2
    min, max = [y1, y2].sort
    min.upto(max).each do |point|
      diagram[point][x1] += 1
    end
  elsif y1 == y2
    min, max = [x1, x2].sort
    min.upto(max).each do |point|
      diagram[y1][point] += 1
    end
  else
    step = x1 < x2 ? 1 : -1
    (x1..x2).step(step).to_a.each_with_index do |pointx, i|
      pointy = y1 < y2 ? (y1 + i) : (y1 - i)
      diagram[pointy][pointx] += 1
    end
  end
end

total = diagram.sum do |row|
  row.select { |point| point > 1 }.count
end

p total
