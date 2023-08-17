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

    print 'Enter music album genre: '
    genre_name = gets.chomp

    print 'Enter music album publish date (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'Is the music album on Spotify? (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    music_album = MusicAlbum.new(title: title, publish_date: publish_date, on_spotify: on_spotify)
    @music_albums << music_album
    # Check if the genre already exists
    genre = @genres.find { |existing_genre| existing_genre.name == genre_name }

    # If the genre doesn't exist, create a new one
    unless genre
      genre = Genre.new(genre_name)
      @genres << genre
    end
    genre.add_item(music_album)
    save_genres
    puts "Music album '#{title}' added."
  end

  def list_music_albums
    puts 'Here are all the music albums:'
    @music_albums.each_with_index do |album, index|
      puts "#{index + 1}. #{album.title} (Published: #{album.publish_date})"
    end
  end

  def list_genres
    puts 'Here are all the genres:'
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}: #{genre.items.count} items"
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
    unless File.exist?('music_albums.json')
      puts 'No music albums found.'
      return
    end

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
        name: genre.name,
        items: genre.items.map { |item| item.title } # Save titles of associated items
      }
    end
    File.write('genres.json', JSON.generate(genre_data))
  end
  

  def load_genres
    return unless File.exist?('genres.json')
  
    json_data = File.read('genres.json')
    genre_data = JSON.parse(json_data)
  
    @genres = genre_data.map do |genre_info|
      genre = Genre.new(genre_info['name'])
      genre_info['items'].each do |item_title|
        item = @music_albums.find { |album| album.title == item_title }
        genre.add_item(item) if item
      end
      genre
    end
  
    puts 'Genres loaded successfully👏'
  end
  
end