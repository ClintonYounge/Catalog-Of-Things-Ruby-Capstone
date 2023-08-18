require_relative 'app'

def main
  app = App.new
  app.load_games_json
  app.load_genres_json

  app.welcome
  app.run

  app.save_authors_json
  app.save_genres_json
  app.save_books_and_labels
end

main
