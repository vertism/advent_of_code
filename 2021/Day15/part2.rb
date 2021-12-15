require 'benchmark'

class Day15
  attr_accessor :cave

  def run
    input = File.open('input').readlines.map(&:strip)

    @cave = []
    y_offset = input.size
    x_offset = input[0].chars.size

    0.upto(4).each do |i|
      0.upto(input.size - 1) do |y|
        @cave[y + (i * y_offset)] = []
      end

      0.upto(4).each do |j|
        input.each_with_index do |row, y|
          row.chars.each_with_index do |val, x|
            risk = ((val.to_i + i + j - 1) % 9) + 1
            @cave[y + (i * y_offset)][x + (j * x_offset)] = risk
          end
        end
      end
    end

    to_visit = [[0, 0]]
    risks = { [0, 0] => 0 }
    overall_best = Float::INFINITY

    while to_visit.size.positive?
      current = to_visit.pop

      children(current).each do |child|
        new_risk = risks[current] + risk_of_point(child)
        current_risk = risks[child] || overall_best

        next unless new_risk < current_risk && new_risk < overall_best

        risks[child] = new_risk
        if end?(child)
          overall_best = new_risk
          p overall_best
        else
          if to_visit.empty? || (distance_to_end(child) + new_risk) < (distance_to_end(to_visit.last) + risks[to_visit.last])
            to_visit.push(child)
          else
            to_visit.unshift(child)
          end
        end
      end
    end

    goal = [@cave.size - 1, @cave[0].size - 1]
    p risks[goal]
  end

  def distance_to_end(point)
    goal = [@cave.size - 1, @cave[0].size - 1]
    (goal.first - point.first) + (goal.last - point.last)
  end

  def risk_of_point(point)
    @cave[point.last][point.first].to_i
  end

  def end?(point)
    point.last == @cave.size - 1 && point.first == @cave[0].size - 1
  end

  def children(point)
    x, y = point

    points = []
    points << [x, y + 1] if y < (@cave.size - 1)
    points << [x, y - 1] if y.positive?
    points << [x + 1, y] if x < (@cave[0].size - 1)
    points << [x - 1, y] if x.positive?
    points
  end
end

time = Benchmark.measure { Day15.new.run }
p time.real


