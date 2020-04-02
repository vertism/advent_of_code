#!/usr/bin/env ruby

file_name = "input"
input = File.open(file_name).readlines.map{|i| i.strip}

positions = {}

input.each_with_index do |wire, index|
  positions[index] = []
  current = "0,0"
  wire.split(',').each do |path|
    direction = path[0]
    steps = path[1..-1].to_i
    1.upto(steps).each do
      x, y = current.split(",").map(&:to_i)
      case direction
      when "R"
        x += 1
      when "D"
        y -= 1
      when "U"
        y += 1
      when "L"
        x -= 1
      end
      current = "#{x},#{y}"
      positions[index] << current
    end
  end
end

crossovers = positions[0] & positions[1]
closest = 10000000
crossovers.each do |position|
  distance = position.split(',').map(&:to_i).map(&:abs).inject(&:+)
  closest = distance if distance < closest
end

p closest
