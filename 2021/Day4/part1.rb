#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

class Board
  def initialize(board)
    @board = board
  end

  def mark(number)
    @board.each do |row|
      row.each_with_index do |value, i|
        if value == number
          row[i] = "*"
          break
        end
      end
    end
  end

  def is_winner?
    complete_row = @board.any? do |row|
      row.all?{ |n| n == "*"}
    end

    complete_col = 0.upto(4).any? do |col|
      @board[col][0] == "*" && @board[col][1] == "*" && @board[col][2] == "*" && @board[col][3] == "*" && @board[col][4] == "*"
    end

    complete_row || complete_col
  end

  def unmarked_sum
    total = 0

    @board.each do |row|
      row.each do |num|
        if num != "*"
          total += num.to_i
        end
      end
    end

    total
  end
end

numbers = input[0].split(',')
boards = []
board = []

input[1..].each_with_index do |line, i|
  if line == ""
    boards << Board.new(board) unless i == 0
    board = []
    next
  end

  board << line.split
  boards << Board.new(board) if i == input.size - 2
end

winner = nil
last_number = nil

numbers.each do |number|
  break if winner
  boards.each do |board|
    board.mark(number)
    if board.is_winner?
      winner = board
      last_number = number
    end
  end
end

p winner.unmarked_sum * last_number.to_i




