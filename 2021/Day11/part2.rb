class Day11
  attr_accessor :octopi, :flashes, :ready_to_flash, :flash_count

  def run
    @octopi = File.open('input').readlines.map(&:strip).map do |line|
      line.chars.map(&:to_i)
    end

    @ready_to_flash = []

    @flash_count = 0

    all_flash_step = nil

    1.upto(1000).each do |step|
      @ready_to_flash = []
      increment
      ready_to_flash.each do |point|
        flash(*point)
      end

      reset_octopi

      if synchronised?
        all_flash_step = step
        break
      end
    end

    p all_flash_step
  end

  def synchronised?
    octopi.all? do |row|
      row.all? { |o| o == 0 }
    end
  end

  def print
    octopi.each do |row|
      p row
    end
    puts
  end

  def increment
    octopi.each_with_index do |row, x|
      row.each_with_index do |_, y|
        octopi[x][y] += 1
        if octopi[x][y] > 9
          ready_to_flash << [x,y]
        end
      end
    end
  end

  def flash(x, y)
    octopi[x][y] = "*"
    increment_point(x-1, y-1)
    increment_point(x-1, y)
    increment_point(x-1, y+1)
    increment_point(x, y-1)
    increment_point(x, y+1)
    increment_point(x+1, y-1)
    increment_point(x+1, y)
    increment_point(x+1, y+1)
  end

  def increment_point(x, y)
    return if octopi[x].nil? || x < 0 || y < 0

    if value = octopi[x][y]
      if value != "*"
        octopi[x][y] += 1
        if value == 9
          ready_to_flash << [x,y]
        end
      end
    end
  end

  def reset_octopi
    octopi.each_with_index do |row, x|
      row.each_with_index do |octopus, y|
        if octopus == "*"
          @flash_count += 1
          octopi[x][y] = 0
        end
      end
    end
  end

end

Day11.new.run
