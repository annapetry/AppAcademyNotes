# require "././exceptions"

class Card
  
  CARD_SUITS = {
    :hearts => "hearts",
    :spades => "spades",
    :clubs => "clubs",
    :diamonds => "diamonds"
  }
  
  CARD_VALUES = {
    :ace => "ace",
    :deuce => "two",
    :three => "three",
    :four => "four",
    :five => "five",
    :six => "six",
    :seven => "seven",
    :eight => "eight",
    :nine => "nine",
    :ten => "ten",
    :jack => "jack",
    :queen => "queen",
    :king => "king"
  }
  
  POINT_VALUES = {
    :deuce => 2,
    :three => 3,
    :four => 4,
    :five => 5,
    :six => 6,
    :seven => 7,
    :eight => 8,
    :nine => 9,
    :ten => 10,
    :jack => 11,
    :queen => 12,
    :king => 13,
    :ace => 14
  }
  
  attr_reader :suit, :value, :point_value 
  
  def initialize(suit, value)
    unless CARD_VALUES.keys.include?(value) && CARD_SUITS.keys.include?(suit)
      raise JokerFaceError.new("Invalid Card") 
    end
    
    @suit = CARD_SUITS[suit]
    @value = CARD_VALUES[value]
    @point_value = POINT_VALUES[value]
    
  end
  
  def self.values
    CARD_VALUES
  end
  
  def self.suits
    CARD_SUITS
  end
  
  # Already knows about itself, no need for this method
  # def self.point_values
  #   POINT_VALUES
  # end
  
  
end