#!/usr/bin/env ruby

input = File.open("input").readlines.map{|i| i.strip}

floor = 0

input[0].each_char do |ins|
  case ins
  when "("
    floor += 1
  when ")"
    floor -= 1
  end
end

p floor
