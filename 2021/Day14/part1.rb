input = File.open('input').readlines.map(&:strip)

template = input[0].chars

hash = input.drop(2).map do |rule|
  rule.split(' -> ')
end.to_h

(1..10).to_a.each do |_|
  matches = []
  template.each_cons(2).with_index do |pair, i|
    if (element = hash[pair.join])
      matches << [i + 1, element]
    end
  end

  matches.each_with_index do |pair, i|
    template.insert(pair.first + i, pair.last)
  end
end

result = template.uniq.map do |el|
  [el, template.count(el)]
end.to_h

p result.max_by { |k, v| v }.last - result.min_by { |k, v| v }.last



