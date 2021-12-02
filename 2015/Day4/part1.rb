#!/usr/bin/env ruby

require "digest"

input = "iwrupvqb"
found = false
n = 0

while !found do
  hash = Digest::MD5.hexdigest("#{input}#{n}")
  if hash[0..4] == "00000"
    found = true
    break
  end

  n += 1
end

p n
