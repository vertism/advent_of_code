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

  def location(i)
    layer = 1
    square = 1
    while square < i
      square += 8 * layer
      layer += 1
    end
  end

  def run2
    directions = [:E, :N, :W, :S]
    positions = [:first, :middle, :penultimate, :last]
    d = 0
    direction = directions[d % directions.size]
    @numbers = [1]
    step = 1
    i = 0
    while i <= 18#@numbers.last < INPUT
      2.times do
        step.times do |j|
          i += 1
          p = if j == step
            3
          elsif j == 0
            0
          elsif j == step - 1
            2
          else
            1
          end
          values = @numbers.values_at(*closest(i, directions[d], positions[p])).inject(&:+)
          @numbers << values
          p @numbers.last
        end
        d += 1
        direction = directions[d % directions.size]
      end
      step += 1
    end
    @numbers.last
  end

  def closest(i, face, position)
    result = [i-1]

    case face
    when :n
      case face
      when :first
        result << i-2
        # down, down left
      when :middle
        # down right, down, down left
      when :penultimate
        # down, down right
      when :last
        # down right
      end
    when :s
      case face
      when :first
        result << i-2
        #  up, up right
      when :middle
        # up left, up, up right
      when :penultimate
        # up left, up
      when :last
        # up left
      end
    when :e
      case face
      when :first
        result << i-2
        # left, up left
      when :middle
        # down left, left, up left
      when :penultimate
        # down left, left
      when :last
        # down left
      end
    when :w
      case face
      when :first
        result << i-2
        # right, down right
      when :middle
        # up right, right, down right
      when :penultimate
        # up right, down
      when :last
        # up right
      end
    end
  end

  def closest(i)
    result = [i-1]
    if i < 9 && i > 1
      result << 0
    end

    if i == 3
      result << 1
    elsif i == 5
      result << 3
    elsif i == 7
      result << [1,5]
    elsif i == 8
      result << 1
    elsif i == 9
      result << 1
    elsif i == 10
      result << [1,2,8]
    elsif i == 11
      result << [1,2]
    elsif i == 12
      result << 2
    elsif i == 13
      result << [2,3,11]
    elsif i == 14
      result << [2,3,4]
    elsif i == 15
      result << [3,4]
    elsif i == 16
      result << 4
    elsif i == 17
      result << [4,5,15]
    end

    result.flatten
  end
end

p Day3.new.run1
p Day3.new.run2