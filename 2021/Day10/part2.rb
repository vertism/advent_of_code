input = File.open("input").readlines.map(&:strip)

scores = []
char_score = [
  [")", 1],
  ["]", 2],
  ["}", 3],
  [">", 4]
].to_h

matches = [
  ["(", ")"],
  ["[", "]"],
  ["{", "}"],
  ["<", ">"]
].to_h

input.each do |line|
  discard = false
  array = []
  line.chars.each do |char|
    if ["(","[","{","<"].include?(char)
      array << char
    else
      match = array.pop
      if char != matches[match] && [")","]","}",">"].include?(char)
        discard = true
      end
    end
  end

  if !discard
    score = 0
    array.reverse.each do |char|
      score = (score * 5) + char_score[matches[char]]
    end
    scores << score
  end
end

p scores.sort[scores.size/2]
