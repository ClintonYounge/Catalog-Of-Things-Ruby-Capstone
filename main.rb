require_relative 'app'

def main
  app = App.new
  app.load_games_and_authors

  app.welcome
  app.run

  app.save_games_and_authors
  app.save_music_albums_and_genres
  app.save_books_and_labels
end

main
