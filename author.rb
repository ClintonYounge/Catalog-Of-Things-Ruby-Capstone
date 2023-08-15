require_relative 'item'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = rand(1..100)
  end

  def add_item(item)
    return if item.author

    item.author = self
    @items << item
    @items
  end
end
