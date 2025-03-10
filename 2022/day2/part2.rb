file = "input"
input = File.open(file).readlines.map(&:strip)

scores = {
  "A": 1,
  "B": 2,
  "C": 3
}

result = input.inject(0) do |sum, round|
  opp, me = round.split(" ")

  if me == "Y"
    score = 3 + scores[opp.to_sym]
  elsif me == "Z"
    score = 6
    if opp == "A"
      score += 2
    elsif opp == "B"
      score += 3
    else
      score += 1
    end
  else
    score = 0
    if opp == "A"
      score += 3
    elsif opp == "B"
      score += 1
    else
      score += 2
    end
  end




  sum + score
end

p result
