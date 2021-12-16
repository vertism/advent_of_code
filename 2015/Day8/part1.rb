class Day8
  def run
    input = File.open('test').readlines.map(&:strip)
    p input

    code = input.sum { |line| line.size }
    p code

    memory = input.sum do |line|
      # line.tr!("\\", "a")
      # line.gsub!(/\\\"/, "a")
      # line.gsub!(/\\x.?.?/, "a")
      p line
      line.size - 2
    end
    p memory

    p code - memory
  end
end

Day8.new.run
