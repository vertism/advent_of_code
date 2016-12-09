#!/usr/bin/env ruby

require 'digest'

class Day5

  def run
    start = Time.now
    password = ''
    password2 = Array.new(8, nil)
    md5 = Digest::MD5.new
    input = 'reyedfim'
    i = 0
    while true
      hash = md5.hexdigest "#{input}#{i}"
      if hash[0..4] == "00000"
        password << hash[5] unless password.size == 8
        if ('0'..'7').include?(hash[5]) && password2[hash[5].to_i].nil?
          password2[hash[5].to_i] = hash[6] unless password2.compact.size == 8
        end
        break if password.size == 8 && password2.compact.size == 8
      end
      i += 1
    end

    puts "Part 1: #{password}"
    puts "Part 2: #{password2.join('')}"
  end
end

Day5.new.run