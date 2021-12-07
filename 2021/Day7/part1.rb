input = File.open('input').readlines.map(&:strip)[0].split(',').map(&:to_i)

min = input.min
max = input.max

smallest = min.upto(max).map do |i|
  input.sum { |n| (n - i).abs }
end.sort.first

p smallest
