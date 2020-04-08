#!/usr/bin/env ruby

min = 168630
max = 718098

passwords = min.upto(max).select do |password|
  array = password.to_s.chars
  next if array.sort.join() != password.to_s
  pairs = array.each_cons(2).select{ |pair| pair.uniq.count == 1 }.flatten.uniq
  next if pairs.empty?
  triplets = array.each_cons(3).select{ |trip| trip.uniq.count == 1 }.flatten.uniq
  next if (pairs - triplets).empty?
  password
end.count

p passwords
