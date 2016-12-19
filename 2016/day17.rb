#!/usr/bin/env ruby

require 'digest'

class Day17

  def run
    @md5 = Digest::MD5.new
    @steps = nil
    @password = "yjjvjgan"

    move("", "00")
    puts "Part 1: #{@steps}"

    @steps = nil
    move("", "00", true)
    puts "Part 2: #{@steps.size}"
  end

  def move(steps, position, longest=false)
    return if !longest && @steps && steps.size > @steps.size

    position = update_position(position, steps.chars.last)
    hash = @md5.hexdigest("#{@password}#{steps}")[0,4]

    loc = Location.new(hash, position)

    if loc.complete?
      @steps = steps unless longest
      @steps = steps if longest && (@steps.nil? || steps.size > @steps.size)
      return
    end

    Location.new(hash, position).directions.each do |d|
      move("#{steps}#{d}", position, longest)
    end
  end

  def update_position(position, direction)
    case direction
    when 'D'
      "#{position[0]}#{position[1].to_i + 1}"
    when 'R'
      "#{position[0].to_i + 1}#{position[1]}"
    when 'L'
      "#{position[0].to_i - 1}#{position[1]}"
    when 'U'
      "#{position[0]}#{position[1].to_i - 1}"
    else
      position
    end
  end
end

class Location

  def initialize(hash, position)
    @hash = hash
    @position = position
  end

  def directions
    unlocked = []
    unlocked << 'D' if down
    unlocked << 'R' if right
    unlocked << 'L' if left
    unlocked << 'U' if up
    unlocked
  end

  def complete?
    @position == "33"
  end

  def up
    open?(@hash[0]) && @position[1].to_i > 0
  end

  def down
    open?(@hash[1]) && @position[1].to_i < 3
  end

  def left
    open?(@hash[2]) && @position[0].to_i > 0
  end

  def right
    open?(@hash[3]) && @position[0].to_i < 3
  end

  def open?(char)
    %w{ b c d e f }.include?(char)
  end
end

Day17.new.run