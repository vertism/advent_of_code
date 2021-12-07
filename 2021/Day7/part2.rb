input = File.open('input').readlines.map(&:strip)[0].split(',').map(&:to_i)

min = input.min
max = input.max

costs = 0.upto(max - min).map do |n|
  [n, 0.upto(n).sum]
end.to_h

smallest = min.upto(max).map do |i|
  input.sum { |n| costs[(n - i).abs] }
end.sort.first

p smallest

