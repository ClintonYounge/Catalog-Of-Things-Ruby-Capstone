class App
  def run
    options
    handle_user_choice
  end

  def run_books
    books_menu
    handle_books_choice
  end

  def run_music
    music_menu
    handle_music_choice
  end

  def run_games
    games_menu
    handle_games_choice
  end

  def options
    puts '1. Books'
    puts '2. Music Album'
    puts '3. Games'
    puts '4. Exit'
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
    run_books
  end

  def list_labels
    puts 'Here are all the labels:'
    run_books
  end

  def add_book
    puts 'Adding a book'
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
    puts 'Here are all the games:'
    run_games
  end

  def list_authors
    puts 'Here are all the authors:'
    run_games
  end

  def add_game
    puts 'Adding a game'
    run_games
  end

  def welcome
    puts 'Welcome to the Catalog of things! What would you like to interact with?'
  end

  def books_menu
    puts 'What would you like to do?'
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. Add a book'
    puts '4. Go back'
  end

  def music_menu
    puts 'What would you like to do?'
    puts '1. List all music albums'
    puts '2. List all genres'
    puts '3. Add a music album'
    puts '4. Go back'
  end

  def games_menu
    puts 'What would you like to do?'
    puts '1. List of games'
    puts '2. List all authors'
    puts '3. Add a game'
    puts '4. Go back'
  end

  def exit_app
    puts 'Thanks for using our app!'
  end
end
