#!/usr/bin/env ruby

class Day11

  def run
    @positions = {}
    collect('12131-0')
    puts "Part 1: #{@positions['44444']}"
    @positions = {}
    collect('11123232323-0')
    puts "Part 2: #{@positions['44444444444']}"
  end

  def collect(start)
    stack = [start]
    while !stack.empty?
      puts stack.size
      state = stack.delete_at(0)
      state, steps = state.split('-')
      next if state == ('4' * state.size)
      state = state.chars.map(&:to_i)
      steps = steps.to_i

      groups(state).each do |objects|
        occupants = *objects
        directions = if state[0] == 1
          [1]
        elsif state[0] == 4
          [-1]
        else
          [1, -1]
        end

        directions.each do |i|
          new_state = state.clone
          if move(i, new_state, occupants, steps)
            stack << "#{new_state.join('')}-#{steps+1}" unless steps >= 30
          end
        end
      end
    end
  end

  def groups(state)
    elevator = state[0]
    available = state.each_index.select{|i| state[i] == elevator }[1..-1]
    available + available.permutation(2).map(&:sort).uniq
  end

  def move(direction, state, occupants, steps)
    ([0] + occupants).each { |i| state[i] += direction }

    if valid = valid?(state)
      identifier = state.join('')
      if !@positions[identifier] || @positions[identifier] > steps+1
        @positions[identifier] = steps+1
      else
        valid = false
      end
    end

    valid
  end

  def reset(direction, state, occupants)
    ([0] + occupants).each { |i| state[i] += direction }
  end

  def valid?(state)
    return false if state[0] < 1 || state[0] > 4
    return false if (state[1] != state[2]) && (state[3] == state[2])
    return false if (state[3] != state[4]) && (state[1] == state[4])
    true
  end

end

Day11.new.run