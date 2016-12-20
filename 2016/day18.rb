#!/usr/bin/env ruby

SAFE = '.'
TRAP = '^'

class Day18
  
  def run
    @rows = 40
    @floor = Array.new(@rows, "")    
    @floor[0] = ".^^^^^.^^^..^^^^^...^.^..^^^.^^....^.^...^^^...^^^^..^...^...^^.^.^.......^..^^...^.^.^^..^^^^^...^."
    puts "Part 1: #{calculate}"
    
    @rows = 400000
    @floor = Array.new(@rows, "")    
    @floor[0] = ".^^^^^.^^^..^^^^^...^.^..^^^.^^....^.^...^^^...^^^^..^...^...^^.^.^.......^..^^...^.^.^^..^^^^^...^."
    puts "Part 2: #{calculate}"
  end
  
  def calculate
    1.upto(@rows-1).each do |row|
      previous = @floor[row-1]
      @floor[row] = @floor.first.size.times.map do |pos|
        Tile.new(pos, previous).value
      end.join
    end
    
    @floor.each.inject(0) do |total, row|
      total + row.count(SAFE)
    end
  end
end

class Tile
  def initialize(pos, previous)
    @previous = previous
    @pos = pos
  end

  def value
    (left_trap && !right_trap) || (right_trap && !left_trap) ? TRAP : SAFE
  end

  def left_trap
    @pos > 0 && @previous[@pos-1] == TRAP
  end

  def centre_trap
    @previous[@pos] == TRAP
  end

  def right_trap
    @pos < (@previous.size - 1) && @previous[@pos+1] == TRAP
  end  
end

Day18.new.run