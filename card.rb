class Card
  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  attr_reader :face_value, :face_up

  def hide
    @face_up = false 
  end
  
  def reveal
    @face_up = true 
  end

  def to_s
    @face_value.to_s
  end

  def self.random
    alphabet = "abcdefghikklmnopqrstuvwxyz".upcase
    random_letter = alphabet.split("").sample
    Card.new(random_letter)
  end
end