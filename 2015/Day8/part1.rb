class Day8
  def run
    file = 'input'

    input = File.readlines(file, chomp: true)
    code = input.sum do |line|
      line.size
    end

    memory = input.sum do |line|
      eval(line).length
    end
    p code - memory
  end
end

Day8.new.run
