require 'benchmark'

class Cube
  attr_accessor :x, :y, :z
  def initialize(x, y, z)
    @x = x[0]..x[1]
    @y = y[0]..y[1]
    @z = z[0]..z[1]
  end

  def size
    s = x.size * y.size * z.size
    s
  end

  def overlaps?(cube)
    %w[x y z].all? do |axis|
      send(axis).first <= cube.send(axis).last && send(axis).last >= cube.send(axis).first
    end
  end

  def split(cube)
    cubes = []

    start_x = [cube.x.first, x.first].max
    end_x = [cube.x.last, x.last].min
    start_y = [cube.y.first, y.first].max
    end_y = [cube.y.last, y.last].min

    # try each face and create cube for each
    if x.first < cube.x.first
      cubes << Cube.new([x.first, cube.x.first - 1], [y.first, y.last], [z.first, z.last])
    end

    if x.last > cube.x.last
      cubes << Cube.new([cube.x.last + 1, x.last], [y.first, y.last], [z.first, z.last])
    end

    if y.first < cube.y.first
      cubes << Cube.new([start_x, end_x], [y.first, cube.y.first - 1], [z.first, z.last])
    end

    if y.last > cube.y.last
      cubes << Cube.new([start_x, end_x], [cube.y.last + 1, y.last], [z.first, z.last])
    end

    if z.first < cube.z.first
      cubes << Cube.new([start_x, end_x], [start_y, end_y], [z.first, cube.z.first - 1])
    end

    if z.last > cube.z.last
      cubes << Cube.new([start_x, end_x], [start_y, end_y], [cube.z.last + 1, z.last])
    end

    cubes
  end
end

class Day22
  attr_accessor :input, :on_blocks

  def initialize
    @input = File.open('input').readlines.map(&:strip)
  end

  def run
    @on_blocks = []

    input.each do |line|
      first, rest = line.split
      turn = first == "on" ? 1 : 0
      parts = rest.split(",").map { |a| a.split("=").last }.map { |a| a.split("..").map(&:to_i) }
      cube = Cube.new(parts[0], parts[1], parts[2])
      handle_collisions(cube)
      @on_blocks << cube if turn == 1
    end

    p on_blocks.sum(&:size)
  end

  def handle_collisions(cube)
    new_blocks = []
    to_delete = []

    on_blocks.each do |block|
      if cube.overlaps?(block)
        to_delete << block
        new_blocks << block.split(cube)
      end
    end

    to_delete.each do |block|
      @on_blocks.delete(block)
    end

    on_blocks.concat(new_blocks.flatten)
  end
end

time = Benchmark.measure do
  time = Day22.new.run
end
p time.real
