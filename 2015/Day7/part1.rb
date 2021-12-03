#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

gates = {}
complete = true

def ins_and(target, parts, gates)
  if parts[0][/\d+/]
    a = parts[0].to_i
  else
    a = gates[parts[0]]
  end

  if parts[0][/\d+/]
    b = parts[0].to_i
  else
    b = gates[parts[2]]
  end

  return false if a.nil? || b.nil?

  gates[target] = a & b
end

def ins_or(target, parts, gates)
  if parts[0][/\d+/]
    a = parts[0].to_i
  else
    a = gates[parts[0]]
  end

  if parts[0][/\d+/]
    b = parts[0].to_i
  else
    b = gates[parts[2]]
  end

  return false if a.nil? || b.nil?

  gates[target] = a | b
end

def ins_not(target, parts, gates)
  a = parts[1]
  return false unless !!gates.key?(a)

  gates[target] = ("%016b" % gates[a]).chars.map{ |i| i == "0" ? "1" : "0" }.join.to_i(2)
end

def ins_rshift(target, parts, gates)
  a = gates[parts[0]]
  shift = parts[2].to_i

  return false if a.nil?

  gates[target] = a >> shift
end

def ins_lshift(target, parts, gates)
  a = gates[parts[0]]
  shift = parts[2].to_i

  return false if a.nil?

  gates[target] = a << shift
end

count = 0

loop do
  input.each do |ins|
    instruction, target = ins.split(' -> ')

    # next if gates.key?(target)

    parts = instruction.split
    if instruction.include?("AND")
      complete = false unless ins_and(target, parts, gates)
    elsif instruction.include?("NOT")
      complete = false unless ins_not(target, parts, gates)
    elsif instruction.include?("RSHIFT")
      complete = false unless ins_rshift(target, parts, gates)
    elsif instruction.include?("LSHIFT")
      complete = false unless ins_lshift(target, parts, gates)
    elsif instruction.include?("OR")
      complete = false unless ins_or(target, parts, gates)
    elsif /\d/ =~ parts[0]
      gates[target] = parts[0].to_i
    elsif gates[parts[0]]
      gates[target] = gates[parts[0]]
    else
      complete = false
    end
  end

  break if complete || count > 20

  count += 1

  complete = true
end

p gates.sort
