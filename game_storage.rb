require_relative 'game'
require_relative 'author'
require 'json'

class GameStorage
  attr_accessor :authors

  def initialize(authors)
    @authors = authors
  end

  def save_authors_json
    authors_data = authors.map do |author|
      author_games_data = author.items.select { |item| item.is_a?(Game) }.map do |game|
        {
          multiplayer: game.multiplayer,
          last_played_at: game.last_played_at,
          published_date: game.published_date
        }
      end

      {
        first_name: author.first_name,
        last_name: author.last_name,
        games: author_games_data
      }
    end

    File.write('authors.json', JSON.generate(authors_data))
  end

  def load_authors_json
    return unless File.exist?('authors.json')

    authors_data = JSON.parse(File.read('authors.json'))
    authors_data.each do |author_data|
      author = Author.new(author_data['first_name'], author_data['last_name'])

      author_data['games'].each do |game_data|
        game = Game.new(game_data['multiplayer'], game_data['last_played_at'], game_data['published_date'])
        author.add_item(game)
      end

      authors << author
      puts 'Authors loaded successfully👏'
    end
  end
end
