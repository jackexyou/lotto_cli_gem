class LottoCliGem::Game
  attr_accessor :name, :winning_numbers

  @@all = []

  def initialize(name, winning_numbers)
    @name = name
    @winning_numbers = winning_numbers
  end

  def winning_numbers
    puts "#{@winning_numbers}"
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

