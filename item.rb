class Item
  attr_accessor :publish_date
  attr_reader :genre, :author, :label

  def initialize(publish_date:, id: nil)
    @id = id || Random.rand(1...1000)
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  def archived?
    @archived = can_be_archived?
    @archived
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def author=(author)
    author.add_item(self)
  end

  def label=(label)
    return if @label == label

    @label = label
    label&.add_item(self)
  end

  private

  def can_be_archived?
    (Date.today - @published_date).to_i >= 3650
  end
end
