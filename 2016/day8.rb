#!/usr/bin/env ruby

class Day8

  def initialize
    @inputs = <<-EOS
      rect 1x1
      rotate row y=0 by 6
      rect 1x1
      rotate row y=0 by 3
      rect 1x1
      rotate row y=0 by 5
      rect 1x1
      rotate row y=0 by 4
      rect 2x1
      rotate row y=0 by 5
      rect 2x1
      rotate row y=0 by 2
      rect 1x1
      rotate row y=0 by 5
      rect 4x1
      rotate row y=0 by 2
      rect 1x1
      rotate row y=0 by 3
      rect 1x1
      rotate row y=0 by 3
      rect 1x1
      rotate row y=0 by 2
      rect 1x1
      rotate row y=0 by 6
      rect 4x1
      rotate row y=0 by 4
      rotate column x=0 by 1
      rect 3x1
      rotate row y=0 by 6
      rotate column x=0 by 1
      rect 4x1
      rotate column x=10 by 1
      rotate row y=2 by 16
      rotate row y=0 by 8
      rotate column x=5 by 1
      rotate column x=0 by 1
      rect 7x1
      rotate column x=37 by 1
      rotate column x=21 by 2
      rotate column x=15 by 1
      rotate column x=11 by 2
      rotate row y=2 by 39
      rotate row y=0 by 36
      rotate column x=33 by 2
      rotate column x=32 by 1
      rotate column x=28 by 2
      rotate column x=27 by 1
      rotate column x=25 by 1
      rotate column x=22 by 1
      rotate column x=21 by 2
      rotate column x=20 by 3
      rotate column x=18 by 1
      rotate column x=15 by 2
      rotate column x=12 by 1
      rotate column x=10 by 1
      rotate column x=6 by 2
      rotate column x=5 by 1
      rotate column x=2 by 1
      rotate column x=0 by 1
      rect 35x1
      rotate column x=45 by 1
      rotate row y=1 by 28
      rotate column x=38 by 2
      rotate column x=33 by 1
      rotate column x=28 by 1
      rotate column x=23 by 1
      rotate column x=18 by 1
      rotate column x=13 by 2
      rotate column x=8 by 1
      rotate column x=3 by 1
      rotate row y=3 by 2
      rotate row y=2 by 2
      rotate row y=1 by 5
      rotate row y=0 by 1
      rect 1x5
      rotate column x=43 by 1
      rotate column x=31 by 1
      rotate row y=4 by 35
      rotate row y=3 by 20
      rotate row y=1 by 27
      rotate row y=0 by 20
      rotate column x=17 by 1
      rotate column x=15 by 1
      rotate column x=12 by 1
      rotate column x=11 by 2
      rotate column x=10 by 1
      rotate column x=8 by 1
      rotate column x=7 by 1
      rotate column x=5 by 1
      rotate column x=3 by 2
      rotate column x=2 by 1
      rotate column x=0 by 1
      rect 19x1
      rotate column x=20 by 3
      rotate column x=14 by 1
      rotate column x=9 by 1
      rotate row y=4 by 15
      rotate row y=3 by 13
      rotate row y=2 by 15
      rotate row y=1 by 18
      rotate row y=0 by 15
      rotate column x=13 by 1
      rotate column x=12 by 1
      rotate column x=11 by 3
      rotate column x=10 by 1
      rotate column x=8 by 1
      rotate column x=7 by 1
      rotate column x=6 by 1
      rotate column x=5 by 1
      rotate column x=3 by 2
      rotate column x=2 by 1
      rotate column x=1 by 1
      rotate column x=0 by 1
      rect 14x1
      rotate row y=3 by 47
      rotate column x=19 by 3
      rotate column x=9 by 3
      rotate column x=4 by 3
      rotate row y=5 by 5
      rotate row y=4 by 5
      rotate row y=3 by 8
      rotate row y=1 by 5
      rotate column x=3 by 2
      rotate column x=2 by 3
      rotate column x=1 by 2
      rotate column x=0 by 2
      rect 4x2
      rotate column x=35 by 5
      rotate column x=20 by 3
      rotate column x=10 by 5
      rotate column x=3 by 2
      rotate row y=5 by 20
      rotate row y=3 by 30
      rotate row y=2 by 45
      rotate row y=1 by 30
      rotate column x=48 by 5
      rotate column x=47 by 5
      rotate column x=46 by 3
      rotate column x=45 by 4
      rotate column x=43 by 5
      rotate column x=42 by 5
      rotate column x=41 by 5
      rotate column x=38 by 1
      rotate column x=37 by 5
      rotate column x=36 by 5
      rotate column x=35 by 1
      rotate column x=33 by 1
      rotate column x=32 by 5
      rotate column x=31 by 5
      rotate column x=28 by 5
      rotate column x=27 by 5
      rotate column x=26 by 5
      rotate column x=17 by 5
      rotate column x=16 by 5
      rotate column x=15 by 4
      rotate column x=13 by 1
      rotate column x=12 by 5
      rotate column x=11 by 5
      rotate column x=10 by 1
      rotate column x=8 by 1
      rotate column x=2 by 5
      rotate column x=1 by 5
    EOS
  end
  
  X = 6
  Y = 50

  def run
    @screen = X.times.map do
      Array.new(Y, false)
    end

    @inputs.split("\n").map(&:strip).each do |input|
      if input =~ /^rect/
        rect(input)
      elsif input =~ /^rotate column/
        rotate_column(input)
      elsif input =~ /^rotate row/
        rotate_row(input)
      end
    end

    puts "Part 1: #{@screen.flatten.count(true)}"

    print_screen
  end

  def rect(input)
    x, y = input_values(input)
    y.times do |row|
      x.times do |col|
        @screen[row][col] = true
      end
    end
  end

  def rotate_column(input)
    col, amount = input_values(input)
    copy = Array.new(X, 0)
    X.times do |i|
      value = @screen[i][col]
      offset = (i + amount) % X
      copy[offset] = value
    end
    copy.each_with_index do |value, i|
      @screen[i][col] = value
    end
  end

  def rotate_row(input)
    row, amount = input_values(input)
    copy = Array.new(Y, 0)
    @screen[row].each_with_index do |value, i|
      offset = (i + amount) % Y
      copy[offset] = value
    end
    @screen[row] = copy
  end

  def input_values(input)
    if match = /(\d+)[^\d]+(\d+)/.match(input)
      [match[1].to_i, match[2].to_i]
    end
  end

  def print_screen
    @screen.each do |col|
      puts col.map { |c| c ? '#' : ' ' }.join
    end
  end
end

Day8.new.run