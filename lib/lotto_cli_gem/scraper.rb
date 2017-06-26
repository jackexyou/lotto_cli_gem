require 'nokogiri'
require 'open-uri'
require 'pry'

class LottoCliGem::Scraper

  def get_games
    site = Nokogiri::HTML(open("http://lottery.olg.ca/en-ca/"))
    game_urls = site.search("div.col-1 a.games-menu-item").collect {|game| game.attr("href")}
    game_urls.pop #removes encore from the list
    game_urls
  end


  def get_winning_number(game_url)
    #scrape name
    site = Nokogiri::HTML(open(game_url))
    name = site.search("title").text.chomp(" | OLG")
    #scrape winning numbers
    winning_numbers = site.search("ul:not(.early-bird).winning-number span.number").collect {|x| x.text}
    LottoCliGem::Game.create_game(name,winning_numbers)
  end

  def scrape_all(game_urls)
    game_urls.each do |game_url|
      get_winning_number(game_url)
    end
  end

end