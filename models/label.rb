class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color, id = nil)
    @id = id || Random.rand(1...10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return unless item.is_a?(Item) && !@items.include?(item)

    @items << item
    item.label = self
  end
end
