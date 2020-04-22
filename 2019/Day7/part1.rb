#!/usr/bin/env ruby

require_relative "../intcode"

def try_phases(phases)
  input = 0
  file_name = "input"
  0.upto(4).each do |amplifier|
    file = File.new(file_name)
    amp = Intcode.new(file, [phases[amplifier], input], nil)
    input = amp.result[0]
  end
  input
end

solution = nil
largest = 0

0.upto(4).each do |i|
  0.upto(4).each do |j|
    next if [i].include?(j)
    0.upto(4).each do |k|
      next if [i,j].include?(k)
      0.upto(4).each do |l|
        next if [i,j,k].include?(l)
        0.upto(4).each do |m|
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

p largest
