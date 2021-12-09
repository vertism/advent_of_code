input = File.open('input').readlines.map(&:strip)

total = 0
input.each do |line|
  _, output = line.split('|')
  total += output.split.count{ |o| [2,3,4,7].include?(o.size) }
end

p total
