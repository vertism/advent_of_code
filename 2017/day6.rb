#!/usr/bin/env ruby

class Day6

  INPUT = %w{5	1	10	0	1	7	13	14	3	12	8	10	7	12	0	6}

  def run
    complete = false
    states = []
    cycle = 0
    banks = INPUT.map(&:to_i)

    until complete
      cycle += 1
      max = banks.max
      started = false
      i = 0
      banks.cycle do |bank|
        if started
          if max > 0
            banks[i] += 1
            max -= 1
          else
            break
          end
        else
          if bank == max
            banks[i] = 0
            started = true
          end
        end

        i = (i + 1) % INPUT.size
      end

      signature = banks.join(' ')
      if states.include?(signature)
        initial = states.index(signature) + 1
        @diff = cycle - initial
        complete = true
        break
      else
        states << signature
      end
    end

    cycle
  end

  def diff
    @diff
  end

end

day6 = Day6.new
p day6.run
p day6.diff