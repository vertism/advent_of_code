#!/usr/bin/env ruby

input = File.open("input").readlines.map{|i| i.strip}

total = 0

input.each do |order|
  vertices = order.split('x').map(&:to_i).sort
  ribbon = (vertices[0] * 2) + (vertices[1] * 2) + vertices.inject(&:*)
  total += ribbon
end

p total
