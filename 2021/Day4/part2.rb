#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

@@order = 0

class Board
  attr_accessor :winner_order

  def initialize(board)
    @board = board
    @winner_order = nil
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
    unless @winner_order.nil?
      return true
    end

    complete_row = @board.any? do |row|
      row.all?{ |n| n == "*"}
    end

    complete_col = 0.upto(4).map do |col|
      0.upto(4).all? { |i| @board[i][col] == "*" }
    end.any?{ |b| !!b }

    if complete_row || complete_col
      @winner_order = @@order
      @@order += 1
    end

    return !!@winner_order
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

  def inspect
    p self.class
    @board.each do |row|
      p row.join(" ")
    end
    p "-----------"
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

last_number = nil

numbers.each do |number|
  last_number = number
  boards.each do |board|
    board.mark(number)
  end

  winners = boards.sum do |board|
    board.is_winner? ? 1 : 0
  end

  break if winners == boards.size
end

worst = boards.sort_by{ |board| board.winner_order }.last

p  worst.unmarked_sum * last_number.to_i




