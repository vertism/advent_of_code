input = File.open('input').readlines.map(&:strip)

caves = Hash.new { |k, v| k[v] = [] }

input.each do |line|
  from, to = line.split('-')
  caves[from] << to
  caves[to] << from
end

def is_small?(cave)
  cave.downcase == cave
end

def paths(caves, visited, from, small_repeat = false)
  if from == "end"
    return 1
  end

  if visited.include?(from)
    if small_repeat || from == 'start'
      return 0
    else
      small_repeat = true
    end
  end

  caves[from].sum do |cave|
    paths(caves, is_small?(from) ? visited + [from] : visited, cave, small_repeat)
  end
end

p paths(caves, [], 'start')
