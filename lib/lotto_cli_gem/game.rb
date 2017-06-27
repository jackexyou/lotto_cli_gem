class LottoCliGem::Game
  attr_accessor :name, :winning_numbers, :bonus

  @@all = []

  def initialize(name, winning_numbers)
    @name = name
    @winning_numbers = winning_numbers
    if @winning_numbers != []
      @bonus = @winning_numbers[-1]
      @winning_numbers.pop
      # "BONUS: #{@winning_numbers[-1]}" 
    end

  end

  def self.create_game(name, winning_numbers)
    game = self.new(name, winning_numbers)
    @@all << game
    game
  end

  def self.all
    @@all
  end

  def self.find_game(name)
    self.all.detect {|game| game.name == name.upcase}
  end

end

