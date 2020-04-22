class Orbits
  attr_reader :orbits

  def initialize(filename)
    input = File.open(filename).readlines.map{|i| i.strip}

    @orbits = input.inject({}) do |hash, orbit|
      orbiting, planet = orbit.split(")")
      hash[planet] = orbiting
      hash
    end
  end

  def part1
    count = orbits.inject(0) do |sum, pair|
      sum + orbit_count(pair[0])
    end

    count
  end

  def orbit_count(planet)
    if orbits.has_key?(planet)
      1 + orbit_count(orbits[planet])
    else
      0
    end
  end

  def part2
    you_path = path([], "YOU")
    santa_path = path([], "SAN")
    path_match = false
    distance = you_path.inject(0) do |sum, path|
      if santa_path.include?(path) && !path_match
        sum += santa_path.index(path) + 2
        path_match = true
      end
      if path_match
        sum
      else
        sum + 1
      end
    end


    distance - 2
  end

  def path(current, from)
    if orbits.has_key?(from)
      orbiting = orbits[from]
      current << orbiting
      path(current, orbiting)
    end
    current.flatten
  end
end
