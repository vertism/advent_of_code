class Day15
  attr_accessor :cave

  def run
    input = File.open('input').readlines.map(&:strip)

    @cave = []

    input.each_with_index do |row, i|
      @cave[i] = row.chars
    end

    @open = [[0, 0]]
    @from = { [0, 0] => 0 }
    overall_best = 1000

    while @open.size.positive?
      current = @open.pop

      children(current).each do |child|
        new_risk = @from[current] + risk_of_point(child)
        current_risk = @from[child] || overall_best

        if new_risk < current_risk && new_risk < overall_best
          @from[child] = new_risk
          if is_end?(child)
            p overall_best
            overall_best = new_risk
          else
            @open.unshift(child)
          end
        end
      end
    end

    goal = [@cave.size - 1, @cave[0].size - 1]
    p @from[goal]
  end

  def risk_of_point(point)
    @cave[point.last][point.first].to_i
  end

  def is_end?(point)
    point.last == @cave.size - 1 && point.first == @cave[0].size - 1
  end

  def children(point)
    x, y = point
    points = []

    if y < (@cave.size - 1)
      points << [x, y + 1]
    end
    if y > 0
      points << [x, y - 1]
    end
    if x < (@cave[0].size - 1)
      points << [x + 1, y]
    end
    if x > 0
      points << [x - 1, y]
    end

    points
  end
end

Day15.new.run
