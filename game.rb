require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"

class Game
  def initialize(name, size=6)
    @board = Board.new(size)
    @board.populate
    @previously_guessed_position = []
    @player = HumanPlayer.new(name)
  end

  def valid_guess?
    guess = @player.get_input
    p @board.size
    p Math.sqrt(@board.size)
    board_size = Math.sqrt(@board.size)
    guess.each do |idx| 
      # p idx
      # p board_size
      if idx > (board_size - 1) || idx < 0
        puts "index out of board"
        # p "#{guess} + !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        valid_guess?
      end
    end
    return guess
  end

  def one_turn_a
    @previously_guessed_position = self.valid_guess?
    @board[@previously_guessed_position].reveal
    new_guess = self.valid_guess?
    @board[new_guess].reveal
    if @board[new_guess] != @board[@previously_guessed_position]
      @board[new_guess].hide 
      @board[@previously_guessed_position].hide
      @previously_guessed_position = []
    end
  end

  def play
    tf = false
    while !false
      self.one_turn_a
      if @board.won?
        tf = true
        puts "YOU WON!!!!!!!!!!!!!"
      end
    end
  end



  # def play
  #   while !@board.won?




end

abc = Game.new("Bob")
abc.play