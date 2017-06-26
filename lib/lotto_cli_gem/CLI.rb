class LottoCliGem::CLI
  
  def call
    scraper = LottoCliGem::Scraper.new
    scraper.scrape_all(scraper.get_games)

    first_prompt
  end

  def list_all_games
    LottoCliGem::Game.all.each.with_index(1) {|game,i| puts "#{i}. #{game.name}"}
  end

  def winning_numbers(input)
    LottoCliGem::Game.all[input.to_i - 1].winning_numbers
  end

  def first_prompt
    
    input = nil
    while input != "back"
      puts "Welcome to OLG Lottery Winning Numbers CLI"
      puts "Please select an option:"
      puts "1. Look up the winning numbers."
      puts "2. Add your own lottery numbers.(NOT AVAILABLE YET)"
      puts "3. Check to see if you're a winner!(NOT AVAILABLE YET)"
      puts "Type 'exit' if you would like to exit the program"

      input = gets.strip

      if input == "1"
        winning_number_prompt
      # elsif input == "2"
      #   input = nil
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
    
    input = nil
    while input != "back"
      puts "Which game would you like to see the winning numbers for?"
      list_all_games
      puts "Type 'back' if you would like to return to the previous menu"
      input = gets.strip
      if input.to_i >= 1 && input.to_i <= 5
        winning_numbers(input)
      elsif input =="back"
        return
      else
        puts "Please select a valid option"
      end
    end

  end

end