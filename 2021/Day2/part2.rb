#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

depth = 0
horizontal = 0
aim = 0

input.each do |ins|
  direction, distance = ins.split
  case direction
  when "forward"
    horizontal += distance.to_i
    depth += aim * distance.to_i
  when "up"
    aim -= distance.to_i
  when "down"
    aim += distance.to_i
  end
end

p depth * horizontal
