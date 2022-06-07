require_relative "card.rb"

class Board
  def initialize(size)
    @size = size ** 2
    if @size.odd?
      raise "size must be an even number"
    end
    @grid = Array.new(size) {Array.new(size) }
    @hidden_grid = Array.new(size) { Array.new(size, " ")}
  end

  attr_reader :size

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, newz)
    row, col = pos
    @grid[row][col] = newz
  end


  def factory
    card_arr = []
    while card_arr.length < (@size / 2)
      card_arr << Card.random
    end
    card_arr
  end
        

  def populate
    cards1 = factory
    cards = []
    cards1.each do |card_inst|
      cards << Card.new(card_inst.face_value)
    end
    cards += cards1
  
    shuffled = cards.shuffle
    @grid.each do |subarr|
      subarr.each_with_index do |ele, idx|
        subarr[idx] = shuffled.pop
      end
    end
    # p @grid
  end

  def render
    @grid.each do |subarr|
      p subarr.map { |ele| ele.face_value }
    end
  end

  def render_hidden
    @hidden_grid.each do |subarr|
      p subarr.map { |ele| ele }
    end
  end

  def won?
    @grid.each do |subarr|
     return true if subarr.all? { |ele| ele.face_up }
    end
    false 
  end

  def flip(pos)
    if !self[pos].face_up
      self[pos].reveal
      @hidden_grid[pos[0]][pos[1]] = self[pos].face_value
    else
      self[pos].hide
      @hidden_grid[pos[0]][pos[1]] = " "
    end
    self[pos].face_value
  end 

end

# abc = Board.new(4)
# abc.populate
# abc.hidden
# # abc.render
# # # p abc.won?

# abc.flip([0,0])
# p abc.hidden_grid
# abc.render_hidden