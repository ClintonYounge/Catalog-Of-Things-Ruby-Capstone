require_relative 'music_album'
require_relative 'genre'

class MusicManager
  def initialize
    @music_albums = []
    @genres = []
    load_music_albums
    load_genres
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
    @music_albums << music_album
    save_music_albums
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

  def save_music_albums
    File.open('data/music_albums.json', 'w') do |file|
      json_data = @music_albums.map(&:to_hash).to_json
      file.write(json_data)
    end
  end

  def load_music_albums
    return unless File.exist?('data/music_albums.json')

    json_data = File.read('data/music_albums.json')
    album_hashes = JSON.parse(json_data)
    @music_albums = album_hashes.map { |hash| MusicAlbum.from_hash(hash) }
  end

  def save_genres
    File.open('data/genres.json', 'w') do |file|
      json_data = @genres.map(&:to_hash).to_json
      file.write(json_data)
    end
  end

  def load_genres
    return unless File.exist?('data/genres.json')

    json_data = File.read('data/genres.json')
    genre_hashes = JSON.parse(json_data)
    @genres = genre_hashes.map { |hash| Genre.from_hash(hash) }
  end
end
