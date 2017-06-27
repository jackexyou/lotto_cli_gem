class LottoCliGem::Ticket
  attr_accessor :game, :numbers

  def initialize(game)
    @game = game
    @numbers = []
  end

  def add_number(input)
    if @numbers.size < @game.winning_numbers.size
      @numbers << input
      @numbers
    end
  end

  def self.create(game_name)
    game = LottoCliGem::Game.find_game(game_name)
    self.new(game)
  end

  def matches
    match_array = @numbers & @game.winning_numbers
    if @numbers.include?(game.bonus)
      match_array << "BONUS: #{game.bonus}"
    end
  end
end