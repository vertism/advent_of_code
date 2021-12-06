#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)[0].split(',').map(&:to_i)

REPEAT = 7

total = input.size

1.upto(256).each do |day|
  input.each_with_index do |fish, i|
    if fish > 0
      input[i] = fish - 1
    end
    if fish == 0
      input[i] = 6
      input[total] = 9
      total += 1
    end
  end
end

p input.size
