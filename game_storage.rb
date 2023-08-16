require_relative 'app'
require_relative 'game'
require_relative 'author'
require 'json'

class GameStorage
  def save_games_json(games)
    games_data = games.map do |game|
      {
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at
      }
    end
    File.write('games.json', JSON.generate(games_data))
  end

  def load_games_json(games)
    unless File.exist?('games.json')
      puts 'No games found.'
      return
    end
    games_data = JSON.parse(File.read('games.json'))

    games_data.each do |game_data|
      game = Game.new(game_data['multiplayer'], game_data['last_played_at'])
      games << game
    end

    puts 'Games loaded successfully!'
  end

  def save_authors_json(authors)
    authors_data = authors.map do |author|
      {
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    File.write('authors.json', JSON.generate(authors_data))
  end

  def load_authors_json(authors)
    unless File.exist?('authors.json')
      puts 'No authors found.'
      return
    end
    authors_data = JSON.parse(File.read('authors.json'))

    authors_data.each do |author_data|
      author = Author.new(author_data['first_name'], author_data['last_name'])
      authors << author
    end

    puts 'Authors loaded successfully!'
  end
end
