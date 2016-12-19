#!/usr/bin/env ruby

class Day16

  def run
    string = "10001001100000001"
    str1 = lengthen(string, 272)
    puts "Part 1: #{checksum(str1)}"

    str2 = lengthen(string, 35651584)
    puts "Part 1: #{checksum(str2)}"
  end

  def lengthen(input, length)
    while input.size < length
      b = input.dup
      b.reverse!
      b.gsub!(/[10]/, '0' => 1, '1' => 0)
      input = "#{input}0#{b}"
    end
    input[0,length]
  end

  def checksum(input)
    even = true
    while even
      input = input.chars.each_slice(2).map(&:join).map do |pair|
        pair[0] == pair[1] ? 1 : 0
      end.join
      even = false unless input.size % 2 == 0
    end
    input
  end

end

Day16.new.run