#!/usr/bin/env ruby

input = File.open("input").readlines.map{|i| i.strip}
fuel = input.inject(0) do |total, mass|
  total += (mass.to_i / 3).round - 2
end
p fuel
