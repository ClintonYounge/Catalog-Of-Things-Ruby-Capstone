require_relative 'music_album'
require_relative 'genre'
require 'date'

class GenreMethods
  attr_accessor :genres

  def initialize(genres)
    @genres = genres
  end

  def add_music
    puts "\nAdding a music album"

    puts "\nEnter the genre of the album:"
    genre_name = gets.chomp.capitalize
    genre = find_or_create_genre(genre_name)

    puts "\nEnter the title of the album:"
    album_title = gets.chomp.capitalize

    puts "\nEnter the publish date of the album (YYYY-MM-DD):"
    publish_date_input = gets.chomp

    puts "\nIs the album on Spotify? (true/false):"
    on_spotify_input = gets.chomp.downcase == 'true'

    album = MusicAlbum.new(album_title, publish_date_input, on_spotify: on_spotify_input)
    genre.add_item(album)

    @genres << genre
    puts "\nThe album '#{album.title}' was added successfully👏"
  end

  def list_genres
    if @genres.empty?
      puts "\nNo genres were found. Feel free to add a new album."
    else
      puts "\nHere are all the genres:"
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}: Genre: #{genre.name}"
        puts '---------------------------------------------------'
      end
    end
  end

  def list_albums
    if @genres.empty?
      puts "\nNo albums were found. Feel free to add a new album."
    else
      puts "\nHere are all the albums:"
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}: Genre: #{genre.name}"
        genre.items.each do |album|
          puts "Title: #{album.title}, Publish date: #{album.publish_date}, On Spotify: #{album.on_spotify}"
          puts '---------------------------------------------------'
        end
      end
    end
  end

  private

  def find_or_create_genre(name)
    existing_genre = @genres.find { |genre| genre.name == name }
    return existing_genre if existing_genre

    Genre.new(name)
  end
end
