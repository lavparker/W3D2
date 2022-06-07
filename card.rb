class Card
  def initialize(face_value)
    @face_value = face_value
    @face_up = [true, false].sample
  end

  def hide
    @face_up = false 
  end
  
  def reveal
    @face_up = true 
  end

  def to_s
    @face_value.to_s
  end

  def ==
     
  end


end