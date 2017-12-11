#!/usr/bin/env ruby

class Day3
  INPUT = 265149

  def run1
    a = 1
    i = 1
    while a < INPUT
      a += 8 * i
      i += 1
    end
    layer = i
    remainder = a - INPUT
    numbers_on_side = (layer * 2) - 1
    x_offset = (numbers_on_side - remainder - (numbers_on_side / 2.0).ceil).abs
    y_offset = numbers_on_side / 2
    x_offset + y_offset
  end

  def previous_square_size(i)
    layer = 1
    max_square = 1
    while max_square < i
      max_square += 8 * layer
      layer += 1
    end

    (layer - 2) * 8
  end

  def run2
    directions = [:S, :E, :N, :W]
    d = 0
    direction = directions[d % directions.size]
    @numbers = [1, 1, 2, 4, 5, 10, 11]
    step = 3
    i = @numbers.size - 1
    while @numbers.last <= INPUT
      2.times do
        step.times do |j|
          i += 1

          position = if j == step - 1
            :last
          elsif j == 0
            :first
          elsif j == step - 2
            :penultimate
          else
            :middle
          end

          @numbers << @numbers.values_at(*closest(i, direction, position)).inject(&:+)
          break if @numbers.last > INPUT
        end
        break if @numbers.last > INPUT
        d += 1
        direction = directions[d % directions.size]
      end
      step += 1
    end
    @numbers.last
  end

  def closest(i, face, position)
    offset = case face
    when :N then 2
    when :S then 6
    when :E then 0
    when :W then 4
    end

    last_row_square = i - previous_square_size(i) - offset

    result = [i - 1]

    case position
    when :first
      result << i - 2
      result << last_row_square - 1
      result << last_row_square
    when :middle
      result << last_row_square - 2
      result << last_row_square - 1
      result << last_row_square
    when :penultimate
      result << last_row_square - 2
      result << last_row_square - 1
    when :last
      result << last_row_square - 2
    end

    result
  end
end

p Day3.new.run1
p Day3.new.run2