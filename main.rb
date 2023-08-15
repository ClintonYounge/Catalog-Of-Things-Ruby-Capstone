require_relative 'app'

def main
  app = App.new
  app.load_games_json
  app.load_authors_json

  app.welcome
  app.run

  save_games_json
  save_authors_json
end

main
