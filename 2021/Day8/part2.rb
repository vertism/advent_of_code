input = File.open('input').readlines.map(&:strip)

total = 0

input.each do |line|
  number_mapping = {}
  patterns_string, output_string = line.split('|')
  patterns = patterns_string.split.map{ |str| str.chars.sort }
  outputs = output_string.split.map{ |str| str.chars.sort.join }
  patterns.each do |pattern|
    case pattern.size
    when 2
      number_mapping[1] = pattern
    when 3
      number_mapping[7] = pattern
    when 4
      number_mapping[4] = pattern
    when 7
      number_mapping[8] = pattern
    end
  end

  patterns.each do |pattern|
    next if [2,3,4,7].include? pattern.size

    case pattern.size
    when 5
      if (pattern & number_mapping[7]).size == 3
        number_mapping[3] = pattern
      elsif (pattern & number_mapping[4]).size == 3
        number_mapping[5] = pattern
      else
        number_mapping[2] = pattern
      end
    when 6
      if (pattern & number_mapping[1]).size == 1
        number_mapping[6] = pattern
      elsif (pattern & number_mapping[4]).size == 3
        number_mapping[0] = pattern
      else
        number_mapping[9] = pattern
      end
    end
  end

  hash = number_mapping.map do |n, letters|
    [letters.join, n]
  end.to_h

  total += outputs.map do |string|
    hash[string]
  end.join.to_i
end

p total
