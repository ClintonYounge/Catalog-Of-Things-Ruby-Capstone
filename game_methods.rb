require_relative 'game'
require_relative 'author'
require 'date'

class GameMethods
  attr_accessor :games

  def list_games(games)
    if games.length.positive?
      games.each do |game|
        puts "Multiplayer: #{game.multiplayer}. Last played at: #{game.last_played_at}"
      end
    else
      puts 'No games found'
    end
  end

  def list_authors(authors)
    if authors.length.positive?
      authors.each do |author|
        puts "First Name: #{author.first_name}, Last Name: #{author.last_name}"
      end
    else
      puts 'No authors found'
    end
  end

  def add_game(games, authors)
    puts "What's the author's first name?"
    first_name = gets.chomp.capitalize
    puts "What's the author's last name?"
    last_name = gets.chomp.capitalize
    puts "What's the name of the game?"
    multiplayer = gets.chomp.capitalize
    puts "What's the last time you played the game?"
    last_played_at = gets.chomp
    begin
      played_date = Date.parse(last_played_at)
      current_date = Date.today
      difference = (current_date - played_date).to_i / 365
      puts "The game was played #{difference} years ago"
    rescue ArgumentError
      puts 'invalid date format. Please enter the date in YYYY-MM-DD format'
    end
    author = Author.new(first_name, last_name)
    authors << author
    game = Game.new(multiplayer, played_date)
    games << game
  end
end
