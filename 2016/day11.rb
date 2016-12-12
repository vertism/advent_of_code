#!/usr/bin/env ruby

# [],
# [:bm, :cm, :dm, :em],
# [:bg, :cg, :dg, :eg],
# [:e, :ag, :am]

class Day11
  Item = Struct.new(:floor, :type) do
    def <=>(other)
      self[:floor] <=> other[:floor]
    end
  end
  
  def initialize
    @e = Item.new(1, 'e')
    @ag = Item.new(1,'ag')
    @am = Item.new(1, 'am')
    @bg = Item.new(2, 'bg')
    @cg = Item.new(2, 'cg')
    @dg = Item.new(2, 'dg')
    @eg = Item.new(2, 'eg')
    @bm = Item.new(3, 'bm')
    @cm = Item.new(3, 'cm')
    @dm = Item.new(3, 'dm')
    @em = Item.new(3, 'em')
    @finished = false
    @indentifiers = []
  end
  
  def run
    until @finished == true
      steps = try_move(0)
    end
    
    puts "Part 1: #{steps}"
  end
  
  def try_move(steps)
    on_elevator_floor_groups.each do |objects|
      [1, -1].each do |i|
        occupants = [objects].flatten
        if move(i, occupants)
          steps += 1

          if all_objects.all? { |o| o[:floor] == 4 }
            @finished = true
          else
            steps += try_move(steps)
          end
        end
      end
    end
    steps
  end
  
  def move(direction, occupants)
    if ![1, -1].include?(direction)
      return false
    end
    
    occupants.each { |o| o[:floor] += direction }
    @e[:floor] += direction
    
    if valid?(direction)
      @indentifiers << identifier
      true
    else
      move(direction * -1, occupants)
      false
    end
  end
  
  def valid?(direction)
    return false if @indentifiers.index(identifier)
    
    if @e[:floor] == 4 && direction == 1 || @e[:floor] == 1 && direction == -1
      return false
    end
    
    if (@ag[:floor] != @am[:floor]) && [@bg[:floor], @cg[:floor], @dg[:floor], @eg[:floor]].include?(@am[:floor])
      return false
    elsif (@bg[:floor] != @bm[:floor]) && [@ag[:floor], @cg[:floor], @dg[:floor], @eg[:floor]].include?(@bm[:floor])
      return false
    elsif (@cg[:floor] != @cm[:floor]) && [@ag[:floor], @bg[:floor], @dg[:floor], @eg[:floor]].include?(@cm[:floor])
      return false
    elsif (@dg[:floor] != @dm[:floor]) && [@ag[:floor], @bg[:floor], @cg[:floor], @eg[:floor]].include?(@dm[:floor])
      return false
    elsif (@eg[:floor] != @em[:floor]) && [@ag[:floor], @bg[:floor], @cg[:floor], @dg[:floor]].include?(@em[:floor])
      return false
    end
    
    true
  end
  
  def on_elevator_floor_groups
    available = all_objects.select { |o| o.floor == @e.floor }
    available + available.permutation(2).to_a.sort.uniq
  end
  
  def all_objects
    [@ag, @am, @bg, @cg, @dg, @eg, @bm, @cm, @dm, @em]
  end
  
  def identifier
    all_objects.map(&:floor).join('')
  end
  
end

Day11.new.run