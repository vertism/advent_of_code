#!/usr/bin/env ruby

require_relative "../intcode"

def try_phases(phases)
  input = 0
  file_name = "input"
  halted = false
  amplifiers = []

  while !halted
    0.upto(4).each do |amplifier|
      if amplifiers.size <= amplifier
        file = File.new(file_name)
        amp = Intcode.new(file, [phases[amplifier], input], nil)
        amplifiers << amp
      else
        amp = amplifiers[amplifier]
        amp.ids = [input]
      end
      input = amp.result.last
      halted = amp.halted
    end
  end
  input
end

solution = nil
largest = 0

5.upto(9).each do |i|
  5.upto(9).each do |j|
    next if [i].include?(j)
    5.upto(9).each do |k|
      next if [i,j].include?(k)
      5.upto(9).each do |l|
        next if [i,j,k].include?(l)
        5.upto(9).each do |m|
          next if [i,j,k,l].include?(m)
          phases = [i,j,k,l,m]
          result = try_phases(phases)
          if result > largest
            largest = result
            solution = phases
          end
        end
      end
    end
  end
end

try_phases([9,8,7,6,5])

p largest
p solution
