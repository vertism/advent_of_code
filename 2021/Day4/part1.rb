#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

class Board
  def initialize(board)
    @board = board
  end

  def mark(number)
    @board.each do |row|
      row.each_with_index do |value, i|
        row[i] = "*" if value == number
      end
    end
  end

  def is_winner?
    complete_row = @board.any? do |row|
      row.all? { |n| n == "*"}
    end

    complete_col = 0.upto(4).any? do |col|
      (0..4).to_a.all? { |i| @board[col][i] == "*" }
    end

    complete_row || complete_col
  end

  def unmarked_sum
    @board.sum do |row|
      row.select { |num| num != "*" }.map(&:to_i).sum
    end
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




