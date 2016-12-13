#!/usr/bin/env ruby

class Day12

  Coord = Struct.new(:x, :y)

  def initialize
    @input = 1352
    @positions = {}
    @x = 50
    @y = 50
  end

  def run
    create_map
    move(Coord.new(1,1), 0)
    target = Coord.new(31, 39)
    
    puts "Part 1: #{@positions[target]}"
    puts "Part 2: #{@positions.values.count { |steps| steps <= 50 }}"
  end
  
  def move(new_position, steps)
    if !@positions.has_key?(new_position) || @positions[new_position] > steps
      @positions[new_position] = steps
    else
      return
    end
    
    @current_position = new_position
    
    possible_moves.each do |new_position|
      move(new_position, steps+1)
    end
  end

  def possible_moves
    moves = []
    if @current_position.y < @y-1 && @map[@current_position.x][@current_position.y+1] == ?.
      moves << Coord.new(@current_position.x, @current_position.y+1)
    end
    if @current_position.y > 0 && @map[@current_position.x][@current_position.y-1] == ?.
      moves << Coord.new(@current_position.x, @current_position.y-1)
    end
    if @current_position.x < @x-1 && @map[@current_position.x+1][@current_position.y] == ?.
      moves << Coord.new(@current_position.x+1, @current_position.y)
    end
    if @current_position.x > 0 && @map[@current_position.x-1][@current_position.y] == ?.
      moves << Coord.new(@current_position.x-1, @current_position.y)
    end
    moves
  end

  def create_map
    @map = @x.times.map do |i|
      @y.times.map do |j|
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
    sum = (coord.x ** 2) + (coord.x * 3) + (2 * coord.x * coord.y) + coord.y + (coord.y ** 2) + @input
    if sum.to_s(2).chars.count{ |c| c == '1' } % 2 == 0
      '.'
    else
      '#'
    end
  end
end

Day12.new.run