#!/usr/bin/env ruby

class Day1

  DIRECTIONS = ['N', 'E', 'S', 'W']

  def run
    inputs = %w{R3, L5, R2, L2, R1, L3, R1, R3, L4, R3, L1, L1, R1, L3, R2, L3, L2, R1, R1, L1, R4, L1, L4, R3, L2, L2, R1, L1, R5, R4, R2, L5, L2, R5, R5, L2, R3, R1, R1, L3, R1, L4, L4, L190, L5, L2, R4, L5, R4, R5, L4, R1, R2, L5, R50, L2, R1, R73, R1, L2, R191, R2, L4, R1, L5, L5, R5, L3, L5, L4, R4, R5, L4, R4, R4, R5, L2, L5, R3, L4, L4, L5, R2, R2, R2, R4, L3, R4, R5, L3, R5, L2, R3, L1, R2, R2, L3, L1, R5, L3, L5, R2, R4, R1, L1, L5, R3, R2, L3, L4, L5, L1, R3, L5, L2, R2, L3, L4, L1, R1, R4, R2, R2, R4, R2, R2, L3, L3, L4, R4, L4, L4, R1, L4, L4, R1, L2, R5, R2, R3, R3, L2, L5, R3, L3, R5, L2, R3, R2, L4, L3, L1, R2, L2, L3, L5, R3, L1, L3, L4, L3}
    @position = {x: 0, y: 0}
    @visited = {}
    @visited['00'] = 1
    @current_direction = 'N'
    @crossover = nil

    inputs.each do |input|
      direction = input.chr
      distance = input[1..-1].to_i
      move(direction, distance)
    end

    puts "Part 1: #{distance_away_from_start}"
    puts "Part 2: #{@crossover}"
  end

  def move(direction, distance)
    turn(direction)

    1.upto(distance).each do |i|
      update_position(direction)
      if @visited.has_key?("#{@position[:x]}-#{@position[:y]}")
        @crossover ||= distance_away_from_start
      end
      @visited["#{@position[:x]}-#{@position[:y]}"] = 1
    end
  end

  def update_position(direction)
    case @current_direction
    when 'N'
      @position[:y] += 1
    when 'E'
      @position[:x] += 1
    when 'S'
      @position[:y] -= 1
    when 'W'
      @position[:x] -= 1
    end
  end

  def turn(direction)
    index = if direction == 'R'
      (DIRECTIONS.index(@current_direction) + 1) % 4
    elsif direction == 'L'
      (DIRECTIONS.index(@current_direction) - 1) % 4
    end

    @current_direction = DIRECTIONS[index]
  end

  def distance_away_from_start
    @position[:x].abs + @position[:y].abs
  end

end

Day1.new.run

