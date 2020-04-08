#!/usr/bin/env ruby

file_name = "input"
input = File.open(file_name).readlines.map{|i| i.strip}

positions = {}

input.each_with_index do |wire, index|
  positions[index] = []
  current = "0,0"
  distance = 0
  wire.split(',').each do |path|
    direction = path[0]
    steps = path[1..-1].to_i
    1.upto(steps).each do
      distance += 1
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
      positions[index] << { location: current, distance: distance }
    end
  end
end

def find_distance(collection, location)
  found = collection.select do |pos|
    pos[:location] == location
  end.first
  found[:distance]
end

crossovers = positions[0].map{ |pos| pos[:location] } & positions[1].map{ |pos| pos[:location] }
closest = 10000000
crossovers.each do |position|
  distance = find_distance(positions[0], position) + find_distance(positions[1], position)
  closest = distance if distance < closest
end

p closest
