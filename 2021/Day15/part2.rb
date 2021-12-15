class Day15
  attr_accessor :cave

  def run
    input = File.open('input').readlines.map(&:strip)

    @cave = []
    y_offset = input.size
    x_offset = input[0].chars.size


    0.upto(4).each do |i|
      input.each_with_index do |_, y|
        @cave[y + (i * y_offset)] = []
      end

      0.upto(4).each do |j|
        input.each_with_index do |row, y|
          row.chars.each_with_index do |val, x|
            @cave[y + (i * y_offset)][x + (j * x_offset)] = ((val.to_i + i + j - 1) % 9) + 1
          end
        end
      end
    end

    @open = [[0, 0]]
    @from = { [0, 0] => 0 }
    overall_best = 10_000

    while @open.size.positive?
      current = @open.pop

      children(current).each do |child|
        new_risk = @from[current] + risk_of_point(child)
        current_risk = @from[child] || overall_best

        next unless new_risk < current_risk && new_risk < overall_best

        @from[child] = new_risk
        if end?(child)
          overall_best = new_risk
        else
          @open.unshift(child)
        end
      end
    end

    goal = [@cave.size - 1, @cave[0].size - 1]
    p @from[goal]
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

Day15.new.run
