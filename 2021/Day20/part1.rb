class Day20
  attr_accessor :algorithm, :image

  def initialize
    input = File.open('input').readlines.map(&:strip)

    @algorithm = input[0]
    @image = input.drop(2).map(&:chars)
  end

  def run
    1.upto(2).each do |i|
      @image = -2.upto(@image.size + 1).map do |y|
        -2.upto(@image[0].size + 1).map do |x|
          default = i % 2 == 0 ? "1" : "0"
          num = from_binary(x, y, default)
          @algorithm[num]
        end
      end
    end

    @image.each do |line|
      p line.first(20)
    end

    lit = @image.sum do |line|
      line.select { |i| i == "#" }.count
    end

    p lit
  end

  def from_binary(x, y, default = "0")
    binary = (y - 1).upto(y + 1).map do |dY|
      (x - 1).upto(x + 1).map do |dX|
        if dX < 0 || dY < 0 || dY >= @image.size || dX >= @image[0].size
          default
        else
          @image[dY][dX] == "." ? "0" : "1"
        end
      end.join
    end.join
    binary.to_i(2)
  end
end

Day20.new.run
