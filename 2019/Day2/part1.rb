#!/usr/bin/env ruby

file_name = "input"
input = File.open(file_name).read.split(',').map(&:to_i)
input[1] = 12
input[2] = 2

index = 0
num = 0
while num != 99
  num = input[index]

  break if num == 99

  if [1, 2].include?(num)
    position1 = input[index+1]
    position2 = input[index+2]
    position3 = input[index+3]
    value1 = input[position1]
    value2 = input[position2]
    if num == 1
      value = value1 + value2
    else
      value = value1 * value2
    end
    input[position3] = value
    index += 4
  end
end

puts input[0]
