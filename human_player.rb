require "byebug"

class HumanPlayer
  def initialize(name)
    @name = name
  end

  attr_reader :name

  def get_input
    puts "Input a position on the grid like: 0 0"
    pos = gets.chomp
    # string = "0 0"
    arr = pos[0].to_i, pos[-1].to_i
  end

end
