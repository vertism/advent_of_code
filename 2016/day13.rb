#!/usr/bin/env ruby

class Day12

  Coord = Struct.new(:x, :y)

  def initialize
    @input = 1352
  end

  def run
    create_map

    @positions = {}
    @steps = 0
    @current_position = Coord.new(1,1)

    possible_moves.each do |new_position|
      move(new_position)
    end

    "Part 1: 90"
  end

  def possible_moves
    moves = []
    if @map[@current_position.x, @current_position.y+1] == '.'
      moves << Coord.new(@current_position.x, @current_position.y+1)
    end
    if @map[@current_position.x, @current_position.y-1] == '.'
      moves << Coord.new(@current_position.x, @current_position.y-1)
    end
    if @map[@current_position.x+1, @current_position.y] == '.'
      moves << Coord.new(@current_position.x+1, @current_position.y)
    end
    if @map[@current_position.x-1, @current_position.y] == '.'
      moves << Coord.new(@current_position.x-1, @current_position.y)
    end
    moves
  end

  def move(new_position)
    @step += 1
    possible_moves.each do |new_position|
      @step += move(new_position)
    end
  end

  def create_map
    @map = 50.times.map do |i|
      50.times.map do |j|
        type(Coord.new(i, j))
      end
    end
  end

  def print_map
    @map.each do |row|
      puts row.join('')
    end
  end

  def type(coord)
    sum = (coord.x * coord.x) + (coord.x * 3) + (2 * coord.x * coord.y) + coord.y + (coord.y * coord.y) + @input
    if sum.to_s(2).chars.count{ |c| c == '1' } % 2 == 0
      '.'
    else
      '#'
    end
  end
end

Day12.new.run