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

  def run2
    i = 1
    @numbers = [1]
    while value <= INPUT
      i += 1
      value = closest(i).sum
      @numbers << value

    end

    value
  end

  def closest(i)
    result = [i-1]
    if i < 10
      result << 1
    end

    if i == 4
      result << 2
    elsif i == 6
      result << 4
    elsif i == 8
      result << [2,6]
    elsif i == 9
      result << 2
    elsif i == 10
      result << 2
    elsif i == 11
      result << [2, 3, 9]
    elsif i == 12
      result << [2,3]
    elsif i == 13
      result << 3
    elsif i == 14
      result << [3,4,12]
    elsif i == 15
      result << [3,4,5]
    elsif i == 16
      result << [4,5]
    elsif i == 17
      result << 5
    elsif i == 18
      result << [5,6,16]
    end

    result.flatten
  end
end

p Day3.new.run1
p Day3.new.run2