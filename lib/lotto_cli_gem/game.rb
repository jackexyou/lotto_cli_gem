class LottoCliGem::Game
  attr_accessor :name, :winning_numbers

  def initialize(name)
    @name = name
    @winning_numbers = [1,2,3,4,5,6]
  end

  def winning_numbers
    puts "#{@winning_numbers}"
  end

end

