#!/usr/bin/env ruby

require 'digest'

class Day14
  def initialize
    @input = "qzyelonm"
    @md5 = Digest::MD5.new
    @hashes = {}
  end

  def run
    puts "Part 1: #{get_hashes}"
    @hashes = {}
    puts "Part 2: #{get_hashes(true)}"
  end

  def get_hashes(stretched=false)
    matches = []
    i = 0
    while matches.size < 64
      if letter = match_triple(get_hash(i, stretched))
        match = false
        (i+1).upto(i+1001).each do |j|
          hash = get_hash(j, stretched)
          break if match = matches(hash, letter*5)
        end
        matches << i if match
      end
      i += 1
    end
    matches.last
  end

  def get_hash(i, stretched)
    if !@hashes[i]
      hash = hash("#{@input}#{i}")
      2016.times { hash = hash(hash) } if stretched
      @hashes[i] = hash
    end
    @hashes[i]
  end

  def hash(input)
    @md5.hexdigest(input)
  end

  def match_triple(hash)
    index = (hash =~ /(.)\1{2,}/)
    index && hash[index]
  end

  def matches(hash, match)
    hash =~ /#{match}/
  end
end

Day14.new.run