class Day21
  attr_accessor :pos_1, :pos_2, :score_1, :score_2, :die, :rolls

  def initialize
    @pos_1 = 8
    @score_1 = 0
    @pos_2 = 9
    @score_2 = 0
    @die = 0
    @rolls = 0
  end

  def run
    end_score = 1000
    while score_1 < end_score && score_2 < end_score
      [1, 2].each do |player|
        move = 1.upto(3).sum do |i|
          @die + i % 100
        end
        @die = (@die + 3) % 100
        if player == 1
          @pos_1 = ((@pos_1 + move - 1) % 10) + 1
          @score_1 += @pos_1
          @rolls += 3
        elsif @score_1 < end_score
          @pos_2 = ((@pos_2 + move - 1) % 10) + 1
          @score_2 += @pos_2
          @rolls += 3
        end
      end
    end

    p "rolls: #{rolls}"
    p "player 1 score #{score_1}"
    p "player 2 score #{score_2}"
    if score_1 < score_2
      p score_1 * rolls
    else
      p score_2 * rolls
    end
  end
end

Day21.new.run
