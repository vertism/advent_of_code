#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

depth = 0
horizontal = 0

input.each do |ins|
  direction, distance = ins.split
  case direction
  when "forward"
    horizontal += distance.to_i
  when "up"
    depth -= distance.to_i
  when "down"
    depth += distance.to_i
  end
end

p depth * horizontal
