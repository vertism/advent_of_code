#!/usr/bin/env ruby

input = File.open("input").readlines.map{|i| i.strip}

floor = 0
input[0].each_char.each_with_index do |ins, i|
  case ins
  when "("
    floor += 1
  when ")"
    floor -= 1
  end
  if floor < 0
    p i + 1
    break
  end
end
