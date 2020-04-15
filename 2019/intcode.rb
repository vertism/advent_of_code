#!/usr/bin/env ruby

class Intcode
  attr_reader :input, :id, :output_position, :outputs

  def initialize(file, id=0, output_position=0)
    @input = file.read.split(',').map(&:to_i)
    @id = id
    @output_position = output_position
    @index = 0
    @outputs = []
  end

  def result
    instruction = Instruction.new(0)
    while instruction.type != Instruction::HALT
      instruction = Instruction.new(input[@index])

      break if instruction.type == Instruction::HALT

      if [Instruction::ADD, Instruction::MULTIPLY].include?(instruction.type)
        add_or_multiply(instruction)
      end

      if instruction.type == Instruction::INPUT
        input_instruction(instruction)
      end

      if instruction.type == Instruction::OUTPUT
        output_instruction(instruction)
      end

      if instruction.type == Instruction::JUMPIFTRUE
        jump_if_true(instruction)
      end

      if instruction.type == Instruction::JUMPIFFALSE
        jump_if_false(instruction)
      end

      if instruction.type == Instruction::LESSTHAN
        values = parameters(instruction)

        if values[0] < values[1]
          input[values[2]] = 1
        else
          input[values[2]] = 0
        end
        @index += 4
      end

      if instruction.type == Instruction::EQUALS
        values = parameters(instruction)

        if values[0] == values[1]
          input[values[2]] = 1
        else
          input[values[2]] = 0
        end
        @index += 4
      end

      if instruction.type == Instruction::UNKNOWN
        break
      end
    end

    if output_position
      outputs << input[output_position]
    end

    outputs
  end

  private

  def instruction(input)
    Instruction.new(input)
  end

  def add_or_multiply(instruction)
    values = parameters(instruction)

    if instruction.type == Instruction::ADD
      value = values[0] + values[1]
    else
      value = values[0] * values[1]
    end

    input[values[2]] = value
    @index += 4
  end

  def input_instruction(instruction)
    @index += 1
    position = input[@index]
    input[position] = id
    @index += 1
  end

  def output_instruction(instruction)
    values = parameters(instruction)
    outputs << values[0]
    @index += 2
  end

  def jump_if_true(instruction)
    values = parameters(instruction)
    if values[0] > 0
      @index = values[1]
    else
      @index += 3
    end
  end

  def jump_if_false(instruction)
    values = parameters(instruction)
    if values[0] == 0
      @index = values[1]
    else
      @index += 3
    end
  end

  def parameters(instruction)
    instruction.parameter_modes.each_with_index.map do |mode, i|
      if mode == "1" || (i == 2 && [Instruction::ADD, Instruction::MULTIPLY, Instruction::LESSTHAN, Instruction::EQUALS].include?(instruction.type))
        value = input[@index + i + 1]
      else
        position = input[@index + i + 1]
        value = input[position]
      end
      value
    end
  end
end

class Instruction
  attr_reader :input

  UNKNOWN = 0
  ADD = 1
  MULTIPLY = 2
  INPUT = 3
  OUTPUT = 4
  JUMPIFTRUE = 5
  JUMPIFFALSE = 6
  LESSTHAN = 7
  EQUALS = 8
  HALT = 99

  def initialize(input)
    @input = "%05d" % input.to_s
  end

  def opcode
    "#{input[3]}#{input[4]}"
  end

  def type
    case opcode
    when "01"
      ADD
    when "02"
      MULTIPLY
    when "03"
      INPUT
    when "04"
      OUTPUT
    when "05"
      JUMPIFTRUE
    when "06"
      JUMPIFFALSE
    when "07"
      LESSTHAN
    when "08"
      EQUALS
    when "99"
      HALT
    else
      UNKNOWN
    end
  end

  def parameter_modes
    2.downto(0).map { |i| input[i] }
  end
end

