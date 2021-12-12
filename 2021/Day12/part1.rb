class Day11


  def run
    system = CaveSystem.new
    input = File.open('input').readlines.map(&:strip)
    input.each do |connection|
      system.add(connection)
    end

    input.each do |connection|
      system.link(connection)
    end

    p system.start_cave.find_routes
  end

  def find_next(cave)
    if cave.end?
      @routes += 1
    else
      cave.linked.each do |link|
        find_next(link)
      end
    end
  end

  class CaveSystem
    def initialize
      @caves = []
    end

    def add(connection)
      from_name, to_name = connection.split('-')
      find(from_name) || @caves << Cave.new(from_name)
      find(to_name) || @caves << Cave.new(to_name)
    end

    def link(connection)
      from_name, to_name = connection.split('-')
      from = find(from_name)
      to = find(to_name)

      from.add_link(to)
      to.add_link(from)
    end

    def find(name)
      @caves.find { |cave| cave.name == name }
    end

    def start_cave
      @caves.find(&:start?)
    end
  end

  class Cave
    attr_accessor :name, :linked

    def initialize(name)
      @name = name
      @linked = []
    end

    def add_link(cave)
      @linked << cave
    end

    def find_routes(used = [])
      routes = 0
      @linked.each do |cave|
        done_with = used.clone
        done_with << self if small?

        next if done_with.include?(cave)

        if cave.end?
          p "END"
          routes += 1
        else
          routes += cave.find_routes(done_with)
        end
      end
      routes
    end

    def big?
      name.upcase == name
    end

    def small?
      name.downcase == name
    end

    def start?
      name == "start"
    end

    def end?
      name == "end"
    end

    def inspect
      name
    end
  end
end

Day11.new.run
