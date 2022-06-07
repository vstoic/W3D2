class Card

  attr_reader :face_value, :face_up
  def initialize
    @face_value = ("a".."z").to_a.sample + ("a".."z").to_a.sample
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  # def to_s
    
  # end

  def ==(other_card)
    self.face_value == other_card.face_value

  end



end


