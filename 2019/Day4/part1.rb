#!/usr/bin/env ruby

min = 168630
max = 718098

passwords = min.upto(max).select do |password|
  array = password.to_s.chars
  next unless array.sort.join() == password.to_s
  next unless array.each_cons(2).any?{ |pair| pair.uniq.count == 1 }
  password
end.count

p passwords
