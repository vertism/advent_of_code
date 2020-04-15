#!/usr/bin/env ruby

require_relative "../intcode"

file_name = "input"
file = File.new(file_name)

ic = Intcode.new(file, 5, nil)
p ic.result
