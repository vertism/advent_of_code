#!/usr/bin/env ruby

input = File.open("input").readlines.map { |i| i.strip.to_i }

windows = 0.upto(input.size - 3).map do |i|
  input[i] + input[i + 1] + input[i + 2]
end

total_increases = 0
windows[1..].each_with_index do |measure, i|
  total_increases += 1 if measure > windows[i]
end

p total_increases
