class Day22
  attr_accessor :input

  def initialize
    @input = File.open('input').readlines.map(&:strip)
    @count = 0
  end

  def run
    hash = {}

    input.each do |line|
      break if @count > 10000
      turn, rest = line.split
      parts = rest.split(",").map { |a| a.split("=").last }.map { |a| a.split("..").map(&:to_i) }
      p parts[0][0]
      p (-50..50).include?(parts[0][0])
      next unless (-50..50).include?(parts[0][0])
      parts[0][0].upto(parts[0][1]).each do |x|
        parts[1][0].upto(parts[1][1]).each do |y|
          parts[2][0].upto(parts[2][1]).each do |z|
            combine = "#{x}-#{y}-#{z}"
            hash[combine] = turn
          end
        end
      end
    end

    total = hash.select{ |h, k| k == "on" }.count
    p total
  end
end

Day22.new.run
