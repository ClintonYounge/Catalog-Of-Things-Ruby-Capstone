require_relative 'game'
require_relative 'author'
require 'date'

class GameMethods
  attr_accessor :authors

  def initialize(authors)
    @authors = authors
  end

  def add_game
    puts "\nAdding a game"

    puts "\nWhat's the name of the game?"
    game_name = gets.chomp.capitalize

    print "\nWhen was the game published date (YYYY-MM-DD):"
    published_date_input = gets.chomp

    puts "\nWhat's the author's first name?"
    first_name = gets.chomp.capitalize

    puts "\nWhat's the author's last name?"
    last_name = gets.chomp.capitalize

    puts "\nWhat's the last time you played the game?"
    last_played_at = gets.chomp

    begin
      played_date = Date.parse(last_played_at)
    rescue ArgumentError
      puts 'invalid date format. Please enter the date in YYYY-MM-DD format'
    end

    author = find_or_create_author(first_name, last_name)
    game = Game.new(game_name, played_date, published_date_input)
    author.add_item(game)
    @authors << author
    puts "\nThe game '#{game_name}' was added successfully👏"
  end

  def list_games
    if authors.empty?
      puts "\nNo games were found. Feel free to add a new game."
    else
      puts "\nHere are all the games:"
      @authors.each do |author|
        author.items.each do |game|
          next unless game.is_a?(Game)

          puts "\nGame: #{game.multiplayer}, Author: #{author.first_name} #{author.last_name}"
          puts "Published on #{game.published_date} and last played on #{game.last_played_at}"
          puts '---------------------------------------------------'
        end
      end
    end
  end

  def list_authors
    if authors.empty?
      puts "\nNo authors were found. Feel free to add a new game."
    else
      puts "\nHere are all the authors:"
      @authors.each do |author|
        puts "First name: #{author.first_name}, last name: #{author.last_name}"
        puts '---------------------------------------------------'
      end
    end
  end

  private

  def find_or_create_author(first_name, last_name)
    existing_author = @authors.find { |author| author.first_name == first_name && author.last_name == last_name }
    return existing_author if existing_author

    Author.new(first_name, last_name)
  end
end
