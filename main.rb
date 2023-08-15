require_relative 'app'
require_relative 'music_manager'

def main
  app = App.new
  app.welcome
  app.run

  MusicManager.save_genres
end

main
