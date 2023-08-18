class Genre
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    return if item.genre

    item.genre = self
    @items << item
  end
end
