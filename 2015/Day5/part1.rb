#!/usr/bin/env ruby

require 'set'

input = File.open('input').readlines.map(&:strip)

def is_nice?(string)
  if string.include?("ab") || string.include?("cd") || string.include?("pq") || string.include?("xy")
    return false
  end

  string.chars.chunk(&:itself).map(&:last).any? { |a| a.size > 1 } &&
    string.count("aeiou") >= 3
end

nice_strings = input.select do |string|
  is_nice?(string)
end

p nice_strings.size
