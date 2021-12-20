class Day18
  attr_accessor :i

  def initialize
    @i = 0
    @input = File.open('input').readlines.map(&:strip)
  end

  def run
    max_mag = 0

    final = @input.each_with_index do |numbera, i|
      @input.each_with_index do |numberb, j|
        next if i == j
        num = add(numbera, numberb)
        mag = magnitude(num)
        if mag > max_mag
          max_mag = mag
        end
      end
    end

    p max_mag
  end

  def add(a, b)
    number = "[#{a},#{b}]"
    reduce(number)
  end

  def reduce(number)
    # p number
    @i += 1
    open_bracket_count = 0
    to_explode = nil
    number.chars.each_with_index do |c, i|
      if c == "["
        open_bracket_count += 1
      elsif c == "]"
        open_bracket_count -= 1
      end
      if open_bracket_count == 5 && to_explode.nil?
        to_explode = i
      end
    end

    if to_explode
      end_array = to_explode + number[to_explode..].index(']')
      data = /\[(\d+)\,(\d+)\]/.match(number[to_explode..])
      first_number = data[1].to_i
      second_number = data[2].to_i

      number[to_explode..end_array] = "0"
      if after_index = number[to_explode + 2..].index(/\d+/)
        extra_digits = number[to_explode + 2 + after_index + 1] =~ /\d/ ? 1 : 0
        next_number = number[to_explode + 2 + after_index..to_explode + 2 + after_index + extra_digits].to_i
        number[to_explode + 2 + after_index..to_explode + 2 + after_index + extra_digits] = (next_number + second_number).to_s
      end

      if before_index = number[0..to_explode-1].rindex(/\d+/)
        previous_digits = number[before_index - 1] =~ /\d/ ? 1 : 0
        previous_number = number[before_index - previous_digits..before_index].to_i
        number[before_index - previous_digits..before_index] = (previous_number + first_number).to_s
      end
      reduce(number)
    else
      split_position = nil
      split_number = nil
      to_split = number.chars.each_cons(2).with_index.any? do |a, index|
        large_number = a.all?{ |i| !(i =~ /\d/).nil? }
        if large_number && !split_position
          split_position = index
          split_number = a.join.to_i
        end
        large_number
      end

      if to_split
        new_pair = "[#{split_number / 2},#{(split_number / 2.0).ceil}]"
        number[split_position..split_position+1] = new_pair
        reduce(number)
      else
        number
      end
    end
  end

  def magnitude(number)
    if data = /\[(\d+)\,(\d+)\]/.match(number)
      first_number = data[1].to_i
      second_number = data[2].to_i
      new_number = (first_number * 3) + (second_number * 2)
      number[data.begin(0)...data.end(0)] = new_number.to_s
      magnitude(number)
    else
      number.to_i
    end
  end
end

Day18.new.run
