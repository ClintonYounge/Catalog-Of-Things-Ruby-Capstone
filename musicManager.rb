require_relative 'music_album'
require_relative 'genre'

class MusicManager
  def initialize
    @music_albums = []
    @genres = []
  end

  def create_music_album
    print 'Enter music album title: '
    title = gets.chomp

    print 'Enter music album publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Is the music album on Spotify? (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    music_album = MusicAlbum.new(title: title, publish_date: publish_date, on_spotify: on_spotify)
    @music_albums << music_album
    puts "Music album '#{title}' added."
  end

  def list_music_albums
    @music_albums.each_with_index do |album, index|
      puts "#{index + 1}. #{album.title} (Published: #{album.publish_date})"
    end
  end

  def list_genres
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}: #{genre.items.count} items"
    end
  end
end
