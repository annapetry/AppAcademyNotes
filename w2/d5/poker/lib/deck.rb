require './card.rb'
# require "././exceptions"

class Deck
  
  attr_reader :cards
  
  def self.all_cards
    deck = []
    Card.values.each do |value, string|
      Card.suits.each do |suit, str|
        deck << Card.new(suit, value)
      end
    end
    
    deck.shuffle!
  end
  
  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def take_cards(num)
    raise NotEnoughCardsError.new("Not enough cards") if num > @cards.count
    @cards.shift(num)
  end
  
  def return_cards(cards)
    @cards.concat(cards)
  end
  
end
