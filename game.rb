require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"

class Game
  def initialize(name, size=6)
    @board = Board.new(size)
    @previously_guessed_position = []
    @player = HumanPlayer.new(name)
  end

  def valid_guess?
    guess = @player.get_input
    board_size = @board.size ** (1/2)
    guess.each do |idx| 
      if idx > (board_size - 1) || idx < 0
        puts "index out of board"
        valid_guess?
      end
    end
    return true
  end



  # def play
  #   while !@board.won?




end

abc = Game.new("Bob")
p abc.valid_guess?