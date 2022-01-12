class Day8
  def run
    file = 'input'

    input = File.readlines(file, chomp: true)
    code = input.sum do |line|
      line.size
    end

    encoded = input.sum do |line|
      line.inspect.size

    end

    p encoded - code
  end
end

Day8.new.run
