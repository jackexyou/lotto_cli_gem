class LottoCliGem::CLI
  
  def call
    puts "Welcome to OLG Lottery Winning Numbers CLI!"
    puts

    scraper = LottoCliGem::Scraper.new
    scraper.scrape_all(scraper.get_games)
    
    first_prompt
  end

  def list_all_games
    LottoCliGem::Game.all.each.with_index(1) {|game,i| puts "#{i}. #{game.name}"}
  end

  def winning_numbers(input)
    game = LottoCliGem::Game.all[input.to_i - 1]
    game.winning_numbers << "BONUS: #{game.bonus}"
  end

  def first_prompt
    
    input = nil
    while input != "back"

      puts "----------------------------------------------------"
      puts "Please select an option:"
      puts "1. Look up the winning numbers."
      puts "2. Add your own lottery tickets."
      puts "3. Check to see if you're a winner!(NOT AVAILABLE YET)"
      puts
      puts "Type 'exit' if you would like to exit the program"
      

      input = gets.strip

      if input == "1"
        winning_number_prompt
      elsif input == "2"
        add_ticket_prompt
      # elsif input == "3"
      #   input = nil
      elsif input =="exit"
        return  
      else
        puts "Please select a valid option"
      end
    end

  end

  def winning_number_prompt
    puts "----------------------------------------------------"
    puts "Which game would you like to see the winning numbers for?"
    puts
    list_all_games
    puts
    puts "Type 'back' if you would like to return to the previous menu"
    
    input = nil
    while input != "back"
      
      input = gets.strip
      if input.to_i >= 1 && input.to_i <= LottoCliGem::Game.all.size
        puts "#{winning_numbers(input)}"
      elsif input =="back"
        return
      else
        puts "Please select a valid option"
      end
    end

  end

  def add_ticket_prompt
    puts "----------------------------------------------------"
    puts "Type the name of your ticket"
    puts
    puts "Type 'back' if you would like to return to the previous menu"
    input = gets.strip
    if input == "back"
      return
    elsif LottoCliGem::Game.find_game(input) == nil
      puts "Invalid Game"
    else
      ticket = LottoCliGem::Ticket.create(input)
      binding.pry
    end
  end

  def add_numbers_prompt
    
  end
end

