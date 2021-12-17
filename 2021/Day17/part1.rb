class Day17
  attr_accessor :target_x, :target_y

  def initialize
    @target_x = 48..70
    @target_y = -189..-148
    # @target_x = 20..30
    # @target_y = -10..-5
  end

  def run
    highest_y = 0
    y = target_y.last

    target_y.first.upto(2000).each do |x|
      1.upto(target_x.last).each do |x|
        success, max_y = fire(x, y)
        if success
          if max_y > highest_y
            highest_y = max_y
          end
        end
      end

      y += 1
    end

    p highest_y
  end

  def fire(x, y)
    # p "FIRE: #{x} #{y}"
    x_position = 0
    y_position = 0
    max_y = y_position
    no_hit = true
    while(no_hit && x_position <= target_x.last && y_position >= target_y.first)
      x_position += x
      y_position += y

      if x > 0
        x -= 1
      elsif x < 0
        x += 1
      end
      y -= 1


      if y_position > max_y
        max_y = y_position
      end

      if target_x.include?(x_position) && target_y.include?(y_position)
        no_hit = false
      end
    end

    [!no_hit, max_y]
  end
end

Day17.new.run
