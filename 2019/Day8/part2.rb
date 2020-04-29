#!/usr/bin/env ruby

file_name = "input"
input = File.open(file_name).readlines.map{|i| i.strip}
width = 25
height = 6

# input = ["0222112222120000"]
# height = 2
# width = 2

digits_in_layer = width * height
input = input[0].chars
final = []

0.upto(digits_in_layer-1).map do |position|
  input.each_slice(digits_in_layer) do |layer|
    next if layer[position].to_i == 2
    final << layer[position]
    break
  end
end

final.each_slice(width) { |row| p row.join().gsub("0", " ") }


