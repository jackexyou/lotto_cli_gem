class LottoCliGem::CLI
  
  def call
    puts "Welcome to OLG Lottery Winning Numbers CLI!"

    scraper = LottoCliGem::Scraper.new
    scraper.scrape_all(scraper.get_games)
    
    first_prompt
  end

  def list_all_games
    LottoCliGem::Game.all.each.with_index(1) {|game,i| puts "#{i}. #{game.name}"}
  end

  def winning_numbers(input)
    game = LottoCliGem::Game.all[input.to_i - 1]
    winning = [] 
    game.winning_numbers.each {|n| winning << n}
    winning << "BONUS: #{game.bonus}"
  end

  def first_prompt
    
    input = nil
    while input != "back"
      puts "----------------------------------------------------"
      puts
      puts "Please select an option:"
      puts "1. Look up the winning numbers."
      puts "2. Add your own lottery tickets."
      puts "3. Check to see if your matching numbers"
      puts
      puts "Type 'exit' if you would like to exit the program"
      

      input = gets.strip

      if input == "1"
        winning_number_prompt
      elsif input == "2"
        add_ticket_prompt
      elsif input == "3"
        matching_numbers_prompt
      elsif input =="exit"
        return  
      else
        puts "Please select a valid option"
      end
    end

  end

  def winning_number_prompt
    puts
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
    puts
    puts "----------------------------------------------------"
    puts "Type the name of your ticket or 'back' if you would like to return to the previous menu"
    puts
    input = gets.strip
    if input == "back"
      return
    elsif LottoCliGem::Game.find_game(input) == nil
      puts "Invalid Game"
    else
      ticket = LottoCliGem::Ticket.create(input)
      puts "Add your numbers:"
      add_numbers_prompt(ticket)
    end
  end

  def add_numbers_prompt(ticket)
    while ticket.numbers.size < ticket.game.winning_numbers.size
      input = gets.strip
      ticket.add_number(input)
      puts "#{ticket.numbers}"
    end
  end

  def matching_numbers_prompt
    LottoCliGem::Ticket.all.each do |ticket|
      print ticket.game.name
      print  " - "
      if ticket.matches == nil
        puts "[]"
      else
        puts "#{ticket.matches}"
      end
    end
  end
end

