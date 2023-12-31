require_relative 'menus'
require './models/book_handler'
require_relative 'game_methods'
require_relative 'game_storage'
require_relative 'genre_methods'
require_relative 'genre_storage'

class App
  def initialize
    @menus = Menus.new
    @books_handler = BookHandler.new
    @authors = []
    @genres = []
    @game_methods = GameMethods.new(@authors)
    @game_storage = GameStorage.new(@authors)
    @genre_methods = GenreMethods.new(@genres)
    @genre_storage = GenreStorage.new(@genres)
  end

  def welcome
    puts "\nWelcome to the Catalog of things! What would you like to interact with?"
  end

  def run
    @menus.main_menu
    handle_user_choice
  end

  def run_books
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

  def handle_user_choice
    choice = gets.chomp.to_i

    menu_options = {
      1 => :run_books,
      2 => :run_music,
      3 => :run_games,
      4 => :exit_app
    }

    if menu_options.key?(choice)
      send(menu_options[choice])
    else
      puts 'Invalid choice. Try again.'
      handle_user_choice
    end
  end

  def handle_books_choice
    choice = gets.chomp.to_i

    menu_options = {
      1 => :list_books,
      2 => :list_labels,
      3 => :add_book,
      4 => :go_back
    }

    if menu_options.key?(choice)
      send(menu_options[choice])
    else
      puts 'Invalid choice. Try again.'
      handle_books_choice
    end
  end

  def handle_music_choice
    choice = gets.chomp.to_i

    menu_options = {
      1 => :list_albums,
      2 => :list_genres,
      3 => :add_music,
      4 => :go_back
    }

    if menu_options.key?(choice)
      send(menu_options[choice])
    else
      puts 'Invalid choice. Try again.'
      handle_music_choice
    end
  end

  def handle_games_choice
    choice = gets.chomp.to_i

    menu_options = {
      1 => :list_games,
      2 => :list_authors,
      3 => :add_game,
      4 => :go_back
    }

    if menu_options.key?(choice)
      send(menu_options[choice])
    else
      puts 'Invalid choice. Try again.'
      handle_games_choice
    end
  end

  def go_back
    @menus.back_main
    run
  end

  def list_books
    @books_handler.list_all_books
    run_books
  end

  def list_labels
    @books_handler.list_all_labels
    run_books
  end

  def list_genres
    @genre_methods.list_genres
    run_music
  end

  def list_albums
    @genre_methods.list_albums
    run_music
  end

  def list_authors
    @game_methods.list_authors
    run_games
  end

  def list_games
    @game_methods.list_games
    run_games
  end

  def add_book
    @books_handler.add_book
    run_books
  end

  def add_music
    @genre_methods.add_music
    run_music
  end

  def add_game
    puts "\nAdding a game"
    @game_methods.add_game
    run_games
  end

  def save_authors_json
    @game_storage.save_authors_json
  end

  def load_games_json
    @game_storage.load_authors_json
  end

  def save_genres_json
    @genre_storage.save_genres_json
  end

  def load_genres_json
    @genre_storage.load_genres_json
  end

  def save_books_and_labels
    @books_handler.save_books_and_labels
  end

  def exit_app
    puts 'Thanks for using our app!'
  end
end
