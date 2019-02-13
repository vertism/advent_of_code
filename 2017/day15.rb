class Day15
  def run
    matching = 0
    divisor = 2147483647
    a_factor = 16807
    b_factor = 48271
    a = 116
    b = 299

    40_000_000.times do
      a = (a * a_factor) % divisor
      b = (b * b_factor) % divisor
      if a.to_s(2)[-16,16] == b.to_s(2)[-16,16]
        matching += 1
      end
    end

    matching
  end
end

p Day15.new.run