#!/usr/bin/env ruby

input = File.open("input").readlines.map{|i| i.strip.to_i}

total_increases = 0
input[1..].each_with_index do |measure, i|
  total_increases += 1 if measure > input[i]
end

p total_increases
