#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)[0].split(',').map(&:to_i)
counts = 0.upto(8).map { |left| [left, input.count(left)] }.to_h

1.upto(256).each do
  counts = 0.upto(8).map do |left|
    if left == 8
      [left, counts[0]]
    elsif left == 6
      [left, counts[0] + counts[7]]
    else
      [left, counts[left + 1]]
    end
  end.to_h
end

p counts.values.sum
