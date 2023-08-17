require_relative 'app'

def main
  app = App.new
  app.load_games_json
  app.load_authors_json

  app.welcome
  app.run

  app.save_games_json
  app.save_authors_json
  app.save_music_albums_json
  app.save_genres
end

main
