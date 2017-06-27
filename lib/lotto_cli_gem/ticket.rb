class LottoCliGem::Ticket
  attr_accessor :game, :numbers

  @@all = []

  def initialize(game)
    @game = game
    @numbers = []
  end

  def add_number(input)
    if @numbers.size < @game.winning_numbers.size
      @numbers << "%02d" % input
      @numbers
    end
  end

  def self.all
    @@all
  end

  def self.create(game_name)
    game = LottoCliGem::Game.find_game(game_name)
    ticket = self.new(game)
    self.all << ticket
    ticket
  end

  def matches
    match_array = @numbers & @game.winning_numbers
    if @numbers.include?(game.bonus)
      match_array << "BONUS: #{game.bonus}"
    end
  end
end