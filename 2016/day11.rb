#!/usr/bin/env ruby

class Day11

  def run
    @positions = {}
    state = [1,1,1,2,3,2,3,2,3,2,3]
    collect([state,0])
    puts "Part 1: #{@positions['4' * state.size]}"

    @positions = {}
    state = [1,1,1,1,1,1,1,2,3,2,3,2,3,2,3]
    collect([state,0])
    puts "Part 2: #{@positions['4' * state.size]}"
  end

  def collect(start)
    stack = [start]
    while !stack.empty?
      state, steps = stack.delete_at(0)

      groups(state).each do |objects|
        occupants = *objects
        directions = []
        directions << 1 if state[0] < 4
        directions << -1 if state[0] > 1

        directions.each do |i|
          new_state = state.clone
          if move(i, new_state, occupants, steps)
            if new_state.all? { |i| i == 4 }
            else
              stack << [new_state, steps+1]
            end
          end
        end
      end

    end
  end

  def groups(state)
    elevator = state[0]
    available = state.each_index.select{|i| state[i] == elevator }[1..-1]
    pairs = available.permutation(2).map(&:sort).uniq
    available + pairs
  end

  def move(direction, state, occupants, steps)
    ([0] + occupants).each { |i| state[i] += direction }

    if valid = valid_move?(state)
      identifier = hash(state)
      if !@positions[identifier] || @positions[identifier] > steps+1
        @positions[identifier] = steps+1
      else
        valid = false
      end
    end

    valid
  end

  def valid_move?(state)
    pairs = pairs(state)
    pairs.all? do |pair|
      pair[0] == pair[1] ||
      !pairs.map { |p| p[0] }.include?(pair[1])
    end
  end

  def hash(state)
    ([state[0]] + pairs(state).flatten).join
  end

  def pairs(state)
    state[1..-1].each_slice(2).to_a.sort
  end

end

Day11.new.run