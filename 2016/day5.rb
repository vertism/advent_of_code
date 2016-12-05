#!/usr/bin/env ruby

require 'digest'

class Day5

  def run
    password = []
    input = 'reyedfim'
    md5 = Digest::MD5.new
    i = 0
    until password.size == 8
      hash = md5.hexdigest "#{input}#{i}"
      i += 1
      if hash[0..4] == "00000"
        password << hash[5]
      end
    end

    puts "Part 1: #{password.join('')}"

    i = 0
    password = Array.new(8, nil)
    until password.compact.size == 8
      hash = md5.hexdigest "#{input}#{i}"
      i += 1
      if hash[0..4] == "00000" && ('0'..'7').include?(hash[5]) && password[hash[5].to_i].nil?
        password[hash[5].to_i] = hash[6]
      end
    end

    puts "Part 1: #{password.join('')}"
  end
end

Day5.new.run