#!/usr/bin/env ruby

require_relative "../intcode"

file_name = "input"
file = File.new(file_name)
ic = Intcode.new(file, [2], nil)

halted = false
while halted == false
  p ic.result
  halted = ic.halted
end

