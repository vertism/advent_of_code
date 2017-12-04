#!/usr/bin/env ruby

class Day3
  INPUT = 265149

  def run
    a = 1
    i = 1
    while a <= INPUT
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
end

p Day3.new.run