#!/usr/bin/env ruby

class Day19

  def initialize
    @elves = @elves_left = 3017957
    @with_presents = Array.new(@elves, true)
    @current = -1
  end

  def run
    while @elves_left > 1
      next_elf_with_present
      next_elf_with_present
      @with_presents[@current] = false
      @elves_left -= 1
    end

    next_elf_with_present
    puts "Part 1: #{@current + 1}"
  end

  def next_elf_with_present
    while true
      @current += 1
      @current %= @elves
      break if @with_presents[@current]
    end
  end

end

Day19.new.run