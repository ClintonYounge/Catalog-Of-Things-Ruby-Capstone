require_relative 'music_album'
require_relative 'genre'
require 'date'

class GenreMethods
  attr_accessor :genres

  def initialize(genres)
    @genres = genres
  end

  def add_music
    puts 'Enter the name of the genre:'
    genre_name = gets.chomp.capitalize

    genre = find_or_create_genre(genre_name)

    puts 'Enter the title of the album:'
    album_title = gets.chomp.capitalize

    puts 'Enter the publish date of the album (YYYY-MM-DD):'
    publish_date_input = gets.chomp

    puts 'Is the album on Spotify? (true/false):'
    on_spotify_input = gets.chomp.downcase == 'true'

    album = MusicAlbum.new(album_title, publish_date_input, on_spotify: on_spotify_input)
    genre.add_item(album)

    @genres << genre
  end

  def list_genres
    @genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
  end

  def list_albums
    @genres.each do |genre|
      genre.items.each do |album|
        next unless album.is_a?(MusicAlbum)

        puts "Album: #{album.title}, Published on: #{album.publish_date}, On Spotify: #{album.on_spotify}"
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
