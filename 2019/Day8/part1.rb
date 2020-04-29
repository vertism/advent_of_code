#!/usr/bin/env ruby

file_name = "input"
input = File.open(file_name).readlines.map{|i| i.strip}
width = 25
height = 6

# input = ["123456789012"]
# height = 3
# width = 2

layers = []
digits_in_layer = width * height
layer = [0,0,0,0,0,0,0,0,0,0]

input[0].chars.each_with_index do |digit, index|
  if (index % digits_in_layer == 0 && index != 0)
    layers << layer
    layer = [0,0,0,0,0,0,0,0,0,0]
  end
  layer[digit.to_i] = layer[digit.to_i] + 1
end

layers << layer

sum = nil
fewest = 100000
layers.each do |layer|
  if layer[0] < fewest
    fewest = layer[0]
    sum = layer[1] * layer[2]
  end
end

p sum

