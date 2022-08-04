class Day7
  attr_accessor :ins, :found

  def initialize
    input = File.open('input').readlines.map(&:strip)

    @ins = {}

    input.each do |line|
      instruction, identifier = line.split(' -> ')
      @ins[identifier] = instruction
    end

    @found = {}
    @count = 0
  end

  def calculate(id)
    if /\d/ =~ id
      return id.to_i
    end

    @count += 1

    if @found[id]
      return @found[id]
    end

    instruction = @ins[id]

    parts = instruction.split

    result = if parts.include?("AND")
      @found[id] = calculate(parts[0]) & calculate(parts[2])
    elsif parts.include?("NOT")
      @found[id] = ("%016b" % calculate(parts[1])).chars.map { |i| i == "0" ? "1" : "0" }.join.to_i(2)
    elsif parts.include?("RSHIFT")
      @found[id] = calculate(parts[0]) >> parts[2].to_i
    elsif parts.include?("LSHIFT")
      @found[id] = calculate(parts[0]) << parts[2].to_i
    elsif parts.include?("OR")
      @found[id] = calculate(parts[0]) | calculate(parts[2])
    elsif /\d/ =~ instruction
      @found[id] = instruction.to_i
    else
      calculate(instruction)
    end

    result
  end
end

day = Day7.new
day.ins["b"] = "956"
day.found = {}
p day.calculate("a")

