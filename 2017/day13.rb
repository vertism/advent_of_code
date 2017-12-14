#!/usr/bin/env ruby

class Day13
  def initialize
    @max_depth = 0
  end

  def scanners
    @scanners ||= begin
      DATA.readlines.map do |input|
        depth, range = input.strip.split(': ')
        @max_depth = [depth.to_i, @max_depth].max
        Scanner.new(depth, range)
      end
    end
  end

  def run(delay=0)
    score = 0

    delay.times do
      scanners.each(&:move)
    end

    0.upto(@max_depth) do |i|
      if scanner = scanners.find{ |scanner| scanner.depth == i }
        if scanner.location == 0
          score += scanner.severity
        end
      end
      scanners.each(&:move)
    end

    score
  end

  def run2
    severity = 1
    delay = 1
    while severity > 0
      scanners.each(&:reset)
      severity = run(delay)
      delay += 1
    end

    delay - 1
  end

  class Scanner
    attr_reader :depth, :range, :location

    def initialize(depth, range)
      @depth = depth.to_i
      @range = range.to_i
      @location = 0
      @forward = true
    end

    def move
      if @forward
        if @location < @range - 1
          @location += 1
        else
          @forward = !@forward
          @location -= 1
        end
      else
        if @location == 0
          @location += 1
          @forward = !@forward
        else
          @location -= 1
        end
      end
    end

    def reset
      @location = 0
      @forward = true
    end

    def severity
      @depth * @range
    end
  end
end

d = Day13.new
p d.run
p d.run2


__END__
0: 3
1: 2
2: 5
4: 4
6: 6
8: 4
10: 8
12: 8
14: 6
16: 8
18: 6
20: 6
22: 8
24: 12
26: 12
28: 8
30: 12
32: 12
34: 8
36: 10
38: 9
40: 12
42: 10
44: 12
46: 14
48: 14
50: 12
52: 14
56: 12
58: 12
60: 14
62: 14
64: 12
66: 14
68: 14
70: 14
74: 24
76: 14
80: 18
82: 14
84: 14
90: 14
94: 17