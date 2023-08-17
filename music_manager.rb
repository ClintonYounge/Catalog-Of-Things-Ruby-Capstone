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
    puts 'Adding a music album'
    print 'Enter music album title: '
    title = gets.chomp

    puts 'What genre is the music album?'
    genre = gets.chomp

    print 'Enter music album publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Is the music album on Spotify? (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    new_genre = Genre.new(genre)
    @genres << new_genre

    music_album = MusicAlbum.new(title: title, publish_date: publish_date, on_spotify: on_spotify)
    @music_albums << music_album
    puts "Music album '#{title}' added."
  end

  def list_music_albums
    puts ' '
    puts 'Here are all the music albums:'
    @music_albums.each_with_index do |album, index|
      puts "#{index + 1}. #{album.title} (Published: #{album.publish_date})"
    end
  end

  def list_genres
    puts ' '
    puts 'Here are all the genres:'
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. Genre Name: #{genre.name}"
    end
  end

  def save_music_albums_json
    music_album_data = @music_albums.map do |music_album|
      {
        title: music_album.title,
        publish_date: music_album.publish_date,
        on_spotify: music_album.on_spotify
      }
    end
    File.write('music_albums.json', JSON.generate(music_album_data))
  end

  def load_music_albums
    return unless File.exist?('music_albums.json')

    albums_data = JSON.parse(File.read('music_albums.json'))

    albums_data.each do |album_data|
      album = MusicAlbum.new(title: album_data['title'], publish_date: album_data['publish_date'],
                             on_spotify: album_data['on_spotify'])
      @music_albums << album
    end
  end

  def save_genres
    genre_data = @genres.map do |genre|
      {
        name: genre.name
      }
    end
    File.write('genres.json', JSON.generate(genre_data))
  end

  def load_genres
    return unless File.exist?('genres.json')

    genres_data = JSON.parse(File.read('genres.json'))

    genres_data.each do |genre_data|
      genre = Genre.new(genre_data['name'])
      @genres << genre
    end
    puts 'Genres loaded successfully👏'
  end
end
