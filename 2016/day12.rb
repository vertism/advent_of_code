#!/usr/bin/env ruby

class Day12
  attr_accessor :a, :b, :c, :d
  
  def initialize
    @a = @b = @c = @d = 0
    @input = "cpy 1 a
      cpy 1 b
      cpy 26 d
      jnz c 2
      jnz 1 5
      cpy 7 c
      inc d
      dec c
      jnz c -2
      cpy a c
      inc a
      dec b
      jnz b -2
      cpy c b
      dec d
      jnz d -6
      cpy 16 c
      cpy 17 d
      inc a
      dec d
      jnz d -2
      dec c
      jnz c -5"
  end

  def run
    start = 0
    complete = false
    
    until complete
      inputs = @input.split("\n")
      inputs.each_with_index do |instruction, index|
        next if index < start
        instruction.strip!
        command, x, y = instruction.split(' ')
        if command == 'cpy'
          copy(x, y)
        elsif command == 'inc'
          increment(x)
        elsif command == 'dec'
          decrement(x)
        elsif command == 'jnz'
          if jump = jump(x, y)
            start = index + y.to_i
            break
          end
        end
        complete = index == inputs.size - 1
      end
    end
    
    puts "Part 1: #{a}"
  end

  def copy(x, register)
    if ('a'..'d').include?(x)
      value = self.send("#{x}")
    else
      value = x.to_i
    end
    send("#{register}=", value)
  end

  def increment(register)
    value = send("#{register}")
    send("#{register}=", value+1)
  end

  def decrement(register)
    value = send("#{register}")
    send("#{register}=", value-1)
  end

  def jump(x, y)
    if ('a'..'d').include?(x)
      value = send("#{x}")
    else
      value = x.to_i
    end
    value > 0
  end
end

day12 = Day12.new
day12.run

day12.c = 1
day12.run
