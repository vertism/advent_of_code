input = File.open('input').readlines.map(&:strip)

template = input[0].chars.each_cons(2).to_a.each_with_object(Hash.new(0)) { |pair, h| h[pair.join] += 1 }

rules = input.drop(2).map do |rule|
  rule.split(' -> ')
end.to_h

(1..40).to_a.each do |_|
  matches = []
  removals = []
  template.each do |pair, count|
    next if count.zero?

    next unless (match = rules[pair])

    matches << ["#{pair[0]}#{match}", count]
    matches << ["#{match}#{pair[1]}", count]
    removals << [pair, count]
  end

  matches.each do |pair|
    template[pair.first] += pair.last
  end

  removals.each do |pair|
    template[pair.first] -= pair.last
  end
end

letters = {}

template.each do |pair, count|
  pair.chars.each do |letter|
    if letters[letter]
      letters[letter] += count
    else
      letters[letter] = count
    end
  end
end

p (letters.max_by { |_, v| v }.last / 2) - (letters.min_by { |_, v| v }.last / 2) - 1
