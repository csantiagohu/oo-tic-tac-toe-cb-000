class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [

  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]

]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    input = (string.to_i - 1)
  end

  def move(index, current_player = "X")
    @board[index] = current_player

  def position_taken?(index)
      if @board[index] == " "
        return false
      elsif @board[index] == ""
        return false
      elsif @board[index] == nil
        return false
      elsif @board[index] == "X" or "O"
        return true
      end
    end

  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        then counter += 1
      end
    end
  return counter
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
        display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    if won? == nil && full? == true
      true
    end
  end

  def over?
    won? || draw? ||full?
  end

  def winner
    if win_combination = won?
      @board[win_combination.first]
    end
  end

  def play
    until over?
      turn
    end
if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end
end
