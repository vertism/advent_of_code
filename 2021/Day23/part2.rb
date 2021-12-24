class Day23
  attr_accessor :best_score, :room_size

  def run
    @best_score = 1_000_000

    positions = {
      "A0" => ["A", 0],
      "A3" => ["B", 0],
      "B0" => ["D", 0],
      "B3" => ["C", 0],
      "C0" => ["C", 0],
      "C3" => ["B", 0],
      "D0" => ["A", 0],
      "D3" => ["D", 0],
      "A1" => ["D", 0],
      "A2" => ["D", 0],
      "B1" => ["B", 0],
      "B2" => ["C", 0],
      "C1" => ["A", 0],
      "C2" => ["B", 0],
      "D1" => ["A", 0],
      "D2" => ["C", 0],
    }

    # positions = {
    #   "A0" => ["D", 0],
    #   "A3" => ["A", 0],
    #   "B0" => ["A", 0],
    #   "B3" => ["C", 0],
    #   "C0" => ["D", 0],
    #   "C3" => ["B", 0],
    #   "D0" => ["B", 0],
    #   "D3" => ["C", 0],
    #   "A1" => ["D", 0],
    #   "A2" => ["D", 0],
    #   "B1" => ["B", 0],
    #   "B2" => ["C", 0],
    #   "C1" => ["A", 0],
    #   "C2" => ["B", 0],
    #   "D1" => ["A", 0],
    #   "D2" => ["C", 0],
    # }

    p positions

    @room_size = 4
    @seen = {}
    @queue = [[positions, min_complete_score(positions)]]

    while @queue.size > 0
      move(@queue.pop[0])
    end

    p best_score
  end

  def move(positions)
    if @seen.has_key?(positions)
      return nil
    else
      @seen[positions] = 1
    end

    if min_complete_score(positions) >= best_score
      return nil
    end

    home_count = 0

    positions.each do |position, amphipod|
      if amphipod[2]
        home_count += 1
        next
      end

      if blocked?(position, positions)
        next
      end

      home_position = available_home_position_for(amphipod, positions)
      start_hall_position = in_room?(position) ? room_to_hall(position[0]) : position
      if home_position && can_move_in_hall?(start_hall_position, room_to_hall(amphipod[0]), positions)
        new_positions = positions.clone
        new_positions.delete(position)
        new_positions["#{amphipod[0]}#{home_position}"] = [amphipod[0], calculate_score(position, "#{amphipod[0]}#{home_position}", amphipod), true]
        min_score = min_complete_score(new_positions)
        if min_score < best_score
          insert_at = @queue.bsearch_index { |positions| positions[1] <= min_score } || @queue.size
          @queue.insert(insert_at, [new_positions, min_score])
        end
      elsif in_room?(position)
        initial_hall_position = room_to_hall(position[0])
        target_hall_positions.each do |hall_position|

          if can_move_in_hall?(initial_hall_position, hall_position, positions)
            new_positions = positions.clone
            new_positions.delete(position)
            new_positions[hall_position] = [amphipod[0], calculate_score(position, hall_position, amphipod)]
            min_score = min_complete_score(new_positions)
            if min_score < best_score
              insert_at = @queue.bsearch_index { |positions| positions[1] <= min_score } || @queue.size
              @queue.insert(insert_at, [new_positions, min_score])
            end
          end
        end
      end
    end

    if home_count > 3
      p positions
      p home_count
    end

    if home_count == positions.size
      total = total_score(positions)

      if total < @best_score
        p positions
        p total
        @best_score = total
      end
    end
  end

  def min_complete_score(positions)
    positions.sum do |position, amphipod|
      if amphipod[2]
        amphipod[1]
      else
        calculate_score(position, "#{amphipod[0]}#{room_size - 1}", amphipod)
      end
    end
  end

  def total_score(positions)
    total_score = 0
    positions.each do |_, amphipod|
      total_score += amphipod[1]
    end
    total_score
  end

  def calculate_score(from, to, amphipod)
    moves = 0
    if in_room?(from)
      moves += room_size - from[1].to_i
      from = room_to_hall(from[0])
    end

    if in_room?(to)
      moves += room_size - to[1].to_i
      to = room_to_hall(to[0])
    end

    moves += (from[1..].to_i - to[1..].to_i).abs

    score_map[amphipod[0]] * moves + amphipod[1]
  end

  def score_map
    {
      "A" => 1,
      "B" => 10,
      "C" => 100,
      "D" => 1000
    }.freeze
  end

  def available_home_position_for(amphipod, positions)
    all = 0.upto(room_size - 1).map do |i|
      positions["#{amphipod[0]}#{i}"]
    end

    if all.compact.any? { |a| a[0] != amphipod[0] }
      return nil
    end

    return all.index(nil)
  end

  def target_hall_positions
    ["H0", "H1", "H3", "H5", "H7", "H9", "H10"].freeze
  end


  def can_move_in_hall?(from, to, positions)
    to_number = to[1..].to_i
    from_number = from[1..].to_i

    if to_number > from_number
      enumerator = (from_number + 1).upto(to_number)
    else
      enumerator = (from_number - 1).downto(to_number)
    end

    enumerator.none? do |hall_number|
      positions.has_key?("H#{hall_number}")
    end
  end

  def room_to_hall(position)
    {
      "A" => "H2",
      "B" => "H4",
      "C" => "H6",
      "D" => "H8"
    }[position[0]]
  end

  def in_room?(position)
    ["A", "B", "C", "D"].include?(position[0])
  end

  def in_hall?(position)
    position[0] == "H"
  end

  def blocked?(position, positions)
    in_room?(position) && position[1..].to_i.zero? && positions.has_key?("#{position[0]}1")
  end
end

Day23.new.run

###

#############
#...........#
###A#C#B#C###
  #D#C#B#A#
  #D#B#A#C#
  #D#A#D#B#
  #########

#############
#.A.B.....AB#
###.#.#C#.###
  #D#.#C#D#
  #########

