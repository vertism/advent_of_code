input = File.open("input").readlines.map(&:to_i)

total_increases = 1.upto(input.size - 1).select do |i|
  input[i] > input[i - 1]
end.count

p total_increases
