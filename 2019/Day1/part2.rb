#!/usr/bin/env ruby

def calculate_fuel_required(mass)
  [0, ((mass / 3).round - 2)].max
end

input = File.open("input").readlines.map{|i| i.strip}
fuel = input.inject(0) do |total, mass|
  current = mass.to_i
  while current > 0
    current = calculate_fuel_required(current)
    total += current
  end
  total
end

p fuel


