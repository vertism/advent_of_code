#!/usr/bin/env ruby

input = File.open("input").readlines.map{|i| i.strip}

total = 0

input.each do |order|
  l, w, h = order.split('x').map(&:to_i)
  sides = [l*w, w*h, h*l]
  surface_area = sides.inject(0) { |tot, side| tot + (2 * side) }
  extra = sides.min
  total += surface_area + extra
end

p total
