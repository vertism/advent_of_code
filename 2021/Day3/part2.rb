#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

length = input[0].length

oxygen = nil
co2 = nil

input2 = input.clone

0.upto(length - 1).each do |bit|
  break unless oxygen.nil?

  values = [0, 0]
  input2.each do |bin|
    value = bin[bit]
    if value == '0'
      values[0] += 1
    else
      values[1] += 1
    end
  end

  if values[1] >= values[0]
    input2.select! { |b| b[bit] == '1' }
  else
    input2.select! { |b| b[bit] == '0' }
  end

  if input2.size == 1
    oxygen = input2[0].to_i(2)
  end
end

input3 = input.clone

0.upto(length - 1).each do |bit|
  break unless co2.nil?

  values = [0, 0]
  input3.each do |bin|
    value = bin[bit]
    if value == '0'
      values[0] += 1
    else
      values[1] += 1
    end
  end

  if values[1] >= values[0]
    input3.select! { |b| b[bit] == '0' }
  else
    input3.select! { |b| b[bit] == '1' }
  end

  if input3.size == 1
    co2 = input3[0].to_i(2)
  end
end

p oxygen
p co2

p oxygen * co2
