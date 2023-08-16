require_relative 'app'

class RunOptions
  def initialize
    @app = App.new
  end
  
  def run(main_menu, handle_user_choice)
    main_menu
    handle_user_choice
  end

  def run_books()
    @menus.books_menu
    handle_books_choice
  end

  def run_music
    @menus.music_menu
    handle_music_choice
  end

  def run_games
    @menus.games_menu
    handle_games_choice
  end
end
