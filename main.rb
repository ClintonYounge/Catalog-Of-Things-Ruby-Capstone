require_relative 'app'
require_relative 'music_manager'

def main
  app = App.new
  app.load_games_json
  app.load_authors_json

  app.welcome
  app.run
  save_games_json
  save_authors_json
  MusicManager.save_genres
end

main
