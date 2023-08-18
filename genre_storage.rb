require_relative 'music_album'
require_relative 'genre'
require 'json'

class GenreStorage
  attr_accessor :genres

  def initialize(genres)
    @genres = genres
  end

  def save_genres_json
    genres_data = genres.map do |genre|
      {
        name: genre.name,
        albums: genre.items.select { |item| item.is_a?(MusicAlbum) }.map do |album|
          {
            title: album.title,
            publish_date: album.publish_date,
            on_spotify: album.on_spotify
          }
        end
      }
    end

    File.write('genres.json', JSON.generate(genres_data))
  end

  def load_genres_json
    return unless File.exist?('genres.json')

    genres_data = JSON.parse(File.read('genres.json'))
    genres_data.each do |genre_data|
      genre = Genre.new(genre_data['name'])

      genre_data['albums'].each do |album_data|
        album = MusicAlbum.new(
          album_data['title'],
          album_data['publish_date'],
          on_spotify: album_data['on_spotify']
        )
        genre.add_item(album)
      end

      genres << genre
      puts 'Genres loaded successfully👏'
    end
  end
end
