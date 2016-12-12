#!/usr/bin/env ruby

class Day12
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
    @input.split("\n").each do |instruction|
      instruction.strip!
      command, x, y = instruction.split(' ')
      if command = 'cpy'
        copy(x, y)
      elsif command == 'inc'
        increment(x)
      elsif command == 'dec'
        decrement(x)
      elsif command == 'jnz'
        jump(x, y)
      end
    end
  end

  def copy(x, register)
    if ['a'..'d'].include?(x)
      value = self.send(x)
    else
      value = x
    end
    self.send("#{register}=", value)
  end

  def increment(register)
    self.send("#{register}+=", 1)
  end

  def decrement(register)
    self.send("#{register}-=", 1)
  end

  def jump(x, y)

  end
end

Day12.new.run