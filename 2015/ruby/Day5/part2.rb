#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

def is_nice?(string)
  has_pair = string.chars.each_with_index.any? do |char, i|
    next if i >= string.chars.size - 3
    string[i + 2..].include?(string[i..i+1])
  end

  has_repeat = string.chars.each_with_index.any? do |char, i|
    next if i >= string.chars.size - 2
    string[i] == string[i+2]
  end

  has_pair && has_repeat
end

nice_strings = input.select do |string|
  is_nice?(string)
end

p nice_strings.size
