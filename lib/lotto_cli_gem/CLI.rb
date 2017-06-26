class LottoCliGem::CLI
  
  def call
    puts "Welcome to OLG Lottery Winning Numbers CLI"
    while add_numbers? == nil 
    end
    
    

  end

  def add_numbers?
    puts "Would you like to add your winning numbers?(y/n)"
    input = gets.strip
    if input == "y"
      puts "hi"
      return 1
    elsif input == "n"
      return 1
    else 
      return nil
    end
  end

end