file = "input"
input = File.open(file).readlines.map(&:strip)

scores = {
  "X": 1,
  "Y": 2,
  "Z": 3
}

result = input.inject(0) do |sum, round|
  opp, me = round.split(" ")
  score = scores[me.to_sym]
  if opp == "A" && me == "X" || opp == "B" && me == "Y" || opp == "C" && me == "Z"
    score += 3
  elsif opp == "A" && me == "Y" || opp == "B" && me == "Z" || opp == "C" && me == "X"
    score += 6
  end

  p score

  sum + score
end

p result
