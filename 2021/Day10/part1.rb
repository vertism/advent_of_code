input = File.open("input").readlines.map(&:strip)

total = 0
array = []
char_score = [
  [")", 3],
  ["]", 57],
  ["}", 1197],
  [">", 25137]
].to_h

matches = [
  ["(", ")"],
  ["[", "]"],
  ["{", "}"],
  ["<", ">"]
].to_h

input.each do |line|
  line.chars.each do |char|
    if ["(","[","{","<"].include?(char)
      array << char
    else
      match = array.pop
      if char != matches[match] && [")","]","}",">"].include?(char)
        total += char_score[char]
      end
    end
  end
end

p total
