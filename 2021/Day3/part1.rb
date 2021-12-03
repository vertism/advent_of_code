#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

length = input[0].length
hash = {}

0.upto(length - 1).each do |bit|
  input.each do |bin|
    hash[bit] ||= { '0': 0, '1': 0 }
    value = bin[bit]
    hash[bit][value.to_sym] += 1
  end
end

gamma = ''
epsilon = ''

hash.each do |key, value|
  if value[:'0'] > value[:'1']
    gamma << '0'
    epsilon << '1'
  else
    gamma << '1'
    epsilon << '0'
  end
end

p gamma.to_i(2) * epsilon.to_i(2)
