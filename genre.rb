require_relative 'music_manager'
# genre.rb
class Genre
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
    MusicManager.save_genres
  end
end
