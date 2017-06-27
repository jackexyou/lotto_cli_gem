class LottoCliGem::Game
  attr_accessor :name, :winning_numbers

  @@all = []

  def initialize(name, winning_numbers)
    @name = name
    @winning_numbers = winning_numbers
    @winning_numbers[-1] = "BONUS: #{@winning_numbers[-1]}" 
  end
  
  def self.create_game(name, winning_numbers)
    game = self.new(name, winning_numbers)
    @@all << game
    game
  end

  def self.all
    @@all
  end

end

