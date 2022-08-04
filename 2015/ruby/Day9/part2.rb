class Day8
  def run
    file = 'input'

    input = File.readlines(file, chomp: true)
    @map = {}

    input.each do |line|
      places, distance = line.split(' = ')
      from, to = places.split(' to ')
      if !@map.has_key?(from)
        @map[from] = []
      end

      if !@map.has_key?(to)
        @map[to] = []
      end

      @map[from] << [to, distance.to_i]
      @map[to] << [from, distance.to_i]
    end

    @max_distance = 0


    @map.keys.each do |from|
      calc(from, 0, [from])
    end

    p @max_distance
  end

  def calc(from, distance, legs)
    if legs.size == @map.size
      if distance > @max_distance
        @max_distance = distance
      end
    end

    @map[from].each do |to|
      next if legs.include?(to.first)
      calc(to.first, distance + to.last, legs + [to.first])
    end
  end
end

Day8.new.run
