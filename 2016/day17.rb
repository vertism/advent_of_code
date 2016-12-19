#!/usr/bin/env ruby

require 'digest'

class Day17

  def run
    md5 = Digest::MD5.new
    @position = "00"
    @steps = ""
    @password = "ihgpwlah"
    while true

    end
  end

  def move(direction)
    input = "#{password}#{steps}"
    hash = md5.hexdigest(input)[0,4]
    directions = Location.new(hash, position).directions
  end
end

class Location

  def initialize(hash, position)
    @hash = hash
    @position = position
  end

  def directions
    unlocked = []
    unlocked << 'D' if down && can_go_down?
    unlocked << 'R' if right && can_go_right?
    unlocked << 'L' if left && can_go_left?
    unlocked << 'U' if up && can_go_up?
    unlocked
  end

  def up
    char = @hash[0]
    open?(char) && @position[1] > 0
  end

  def down
    char = @hash[1]
    open?(char) && @position[1] < 3
  end

  def left
    char = @hash[2]
    open?(char) && @position[0] > 0
  end

  def right
    char = @hash[3]
    open?(char) && @position[0] < 3
  end

  def open?(char)
    %w{ b c d e f }.include?(char)
  end
end

Day17.new.run