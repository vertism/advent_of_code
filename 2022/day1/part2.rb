#!/usr/local/bin/ruby

file = "input"
elves = File.read(file).split("\n\n")
values = elves.map do |elf_input|
  elf_input.split("\n").map(&:to_i).sum
end

p values.sort.reverse.first(3).sum
