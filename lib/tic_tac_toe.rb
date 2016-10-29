class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]
  def initialize
    @board = Array.new(9, " ")
  end
  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def move(position, token = "X")
      @board[position.to_i - 1] = token
    end
    def position_taken?(position)
      !(@board[position] == " " || @board[position].nil?)
    end
    def valid_move?(position)
      !position_taken?(position.to_i - 1) && position.to_i.between?(1,9)
    end
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      if (!valid_move?(input))
        turn
      end
      move(input, current_player )
      display_board
    end
    def turn_count
      @board.count{|cell| cell == "X" || cell == "O"}
    end
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
    def full?
      @board.all? { |e| e == "X" || e =="O" }
    end
    def won?
      WIN_COMBINATIONS.detect do |raw|
        @board[raw[0]] == @board[raw[1]] &&
        @board[raw[1]] == @board[raw[2]] &&
        position_taken?(raw[0])
      end
   end
   def draw?
     !won? && full?
   end
   def over?
     won? || draw?
   end
   def winner
     if winning_combo = won?
       @board[winning_combo.first]
     end
   end
   def play
     while !over?
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cats Game!"
     end
   end
end
