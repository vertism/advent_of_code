#!/usr/bin/env ruby

class Day10
  INPUT = "147,37,249,1,31,2,226,0,161,71,254,243,183,255,30,70"

  def run
    list = 0.upto(255).to_a
    current_position = 0
    skip_size = 0
    lengths = INPUT.split(',').map(&:to_i)
    lengths.each do |length|
      new_list = []
      if current_position + length > list.length
        wrapped_length = length - (list.length - current_position)
        reversed_part = (list[current_position..-1] + list[0..wrapped_length-1]).reverse
        new_list += reversed_part[reversed_part.length - wrapped_length..-1]
        new_list += list[wrapped_length..current_position-1]
        new_list += reversed_part.first(length - wrapped_length)
      else
        new_list += list[0..current_position-1] if current_position > 0
        new_list += list[current_position, length].reverse
        new_list += list[current_position + length..-1]
      end
      list = new_list
      current_position = (current_position + length + skip_size) % list.length
      skip_size += 1
    end

    list[0] * list[1]
  end
end

p Day10.new.run