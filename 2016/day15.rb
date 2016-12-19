#!/usr/bin/env ruby

class Day15

  def run
    @discs = [
      Disc.new(7, 0),
      Disc.new(13, 0),
      Disc.new(3, 2),
      Disc.new(5, 2),
      Disc.new(17, 0),
      Disc.new(19, 7)
    ]

    puts "Part 1: #{calculate}"

    @discs << Disc.new(11, 0)

    puts "Part 1: #{calculate}"
  end

  def calculate
    i = 0
    while true
      i += 1
      break if @discs.each_with_index.all? do |disc, index|
        disc.open_at_time?(i + index)
      end
    end
    i-1
  end

end

class Disc
  def initialize(positions, start)
    @positions = positions
    @start = start
  end

  def open_at_time?(time)
    (@start + time) % @positions == 0
  end
end

Day15.new.run