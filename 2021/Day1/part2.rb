input = File.open("input").readlines.map(&:to_i)

total_increases = 1.upto(input.size - 1).each_cons(3).select do |array|
  array.sum { |n| input[n] } > array.sum { |n| input[n - 1] }
end.count

p total_increases
