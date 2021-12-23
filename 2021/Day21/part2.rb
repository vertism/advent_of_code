class Day21
  attr_accessor :target

  def initialize
    @target = 21
    @cache = {}
  end

  def run
    player_1_wins, player_2_wins = take_turn(1, 8, 0, 9, 0)

    p player_1_wins
    p player_2_wins
    p [player_1_wins, player_2_wins].max
  end

  def possibilities
    [3, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 8, 8, 8, 9].freeze
  end

  def take_turn(player, pos_1, score_1, pos_2, score_2)
    if (cached = @cache[[player, pos_1, score_1, pos_2, score_2].join('-')])
      cached
    else
      wins = [0, 0]
      possibilities.each do |roll|
        if player == 1
          pos = ((pos_1 + roll - 1) % 10) + 1
          score = score_1 + pos
          if score >= target
            wins[0] += 1
          else
            result = take_turn(2, pos, score, pos_2, score_2)
            @cache[[2, pos, score, pos_2, score_2].join('-')] = result
            wins[0] += result[0]
            wins[1] += result[1]
          end
        else
          pos = ((pos_2 + roll - 1) % 10) + 1
          score = score_2 + pos
          if score >= target
            wins[1] += 1
          else
            result = take_turn(1, pos_1, score_1, pos, score)
            @cache[[1, pos_1, score_1, pos, score].join('-')] = result
            wins[0] += result[0]
            wins[1] += result[1]
          end
        end
      end
      wins
    end
  end
end

Day21.new.run
