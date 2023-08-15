require_relative 'menus'
require_relative 'game_methods'
require './models/book_handler'

class App
  def initialize
    @menus = Menus.new
    @game_methods = GameMethods.new
    @books_handler = BookHandler.new
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
      options
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
      options
      handle_books_choice
    end
  end

  def handle_music_choice
    choice = gets.chomp.to_i

    menu_options = {
      1 => :list_music,
      2 => :list_genres,
      3 => :add_music,
      4 => :go_back
    }

    if menu_options.key?(choice)
      send(menu_options[choice])
    else
      puts 'Invalid choice. Try again.'
      options
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
      options
      handle_games_choice
    end
  end

  def go_back
    puts 'Going back...'
    puts '-------------------------'
    run
  end

  def list_books
    puts 'Here are all the books:'
    @books_handler.list_all_books
    run_books
  end

  def list_labels
    puts 'Here are all the labels:'
    @books_handler.list_all_labels
    run_books
  end

  def add_book
    puts 'Adding a book'
    @books_handler.add_book
    run_books
  end

  def list_music
    puts 'Here are all the music albums:'
    run_music
  end

  def list_genres
    puts 'Here are all the genres:'
    run_music
  end

  def add_music
    puts 'Adding a music album'
    run_music
  end

  def list_games
    @game_methods.list_games
    run_games
  end

  def list_authors
    @game_methods.list_authors
    run_games
  end

  def add_game
    @game_methods.add_game
    run_games
  end

  def welcome
    puts 'Welcome to the Catalog of things! What would you like to interact with?'
  end

  def exit_app
    puts 'Thanks for using our app!'
  end
end
