#!/usr/bin/env ruby

class Day11
  def run
    @positions = {}
    state = State.new([1,1,1,2,3,2,3,2,3,2,3])
    collect([state,0])
    puts "Part 1: #{@positions['4' * state.size]}"

    @positions = {}
    state = State.new([1,1,1,1,1,1,1,2,3,2,3,2,3,2,3])
    collect([state,0])
    puts "Part 2: #{@positions['4' * state.size]}"
  end

  def collect(start)
    stack = [start]
    while !stack.empty?
      state, steps = stack.delete_at(0)
      state.groups.each do |objects|
        directions = []
        directions << 1 if state.elevator < 4
        directions << -1 if state.elevator > 1

        directions.each do |i|
          new_state = state.clone
          occupants = *objects
          if move(i, new_state, occupants, steps) && !new_state.goal?
            stack << [new_state, steps+1]
          end
        end
      end

    end
  end

  def move(direction, state, occupants, steps)
    ([0] + occupants).each { |i| state[i] += direction }

    if valid = state.valid?
      if !@positions[state.hash] || @positions[state.hash] > steps+1
        @positions[state.hash] = steps+1
      else
        valid = false
      end
    end

    valid
  end
end

class State < Array
  def elevator
    self[0]
  end

  def hash
    ([elevator] + pairs.flatten).join
  end

  def pairs
    self[1..-1].each_slice(2).to_a.sort
  end

  def groups
    available = self.each_index.select{|i| self[i] == elevator }[1..-1]
    pairs = available.permutation(2).map(&:sort).uniq
    available + pairs
  end

  def goal?
    self.all? { |i| i == 4 }
  end

  def valid?
    pairs.all? do |pair|
      pair[0] == pair[1] ||
      !pairs.map { |p| p[0] }.include?(pair[1])
    end
  end
end

Day11.new.run