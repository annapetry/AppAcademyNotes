require "././exceptions"

class Tower

# accessing wrong instance variables of hash
# @tower instance variable   
  # TOWERS = {
  #   0 => [3, 2, 1],
  #   1 => @tower1,
  #   2 => @tower2
  # }
  
  attr_accessor :tower0, :tower1, :tower2
  
  # shoudl initialize 2d array
  
  def initialize
    @tower0 = [3, 2, 1]
    @tower1 = []
    @tower2 = []
    
    @TOWERSHASH = {
      0 => @tower0,
      1 => @tower1,
      2 => @tower2
    }
  
  end

  def prompt_user
    begin
      puts "Which tower do you want to TAKE from?: "
      from = gets.chomp
      puts "Which tower would you like to PUT your disc on?: "
      to_tower = gets.chomp
      
      valid_input?(from, to_tower)
      
    rescue ArgumentError => e
      print e.message
      retry
    end

  end


  def valid_input?(from, to_tower)
    raise ArgumentError.new("Not an Integer") unless Integer(from) && Integer(to_tower)
    
    raise OutOfRangeError.new("Not in Range") unless (0..2).cover?(from) && (0..2).cover?(to_tower)
    
    (0..2).cover?(from) && (0..2).cover?(to_tower)
  end


  def take_from(tower_number)
    raise EmptyTowerError.new("Selected Tower is Empty") if TOWERS[tower_number].nil?
    
    TOWERS[tower_number].pop
  end

  

end