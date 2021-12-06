#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

diagram = Array.new(1000) { Array.new(1000, 0) }

input.each do |segment|
  coord1, coord2 = segment.split(' -> ')
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
  end
end

total = diagram.sum do |row|
  row.select { |point| point > 1 }.count
end

p total
