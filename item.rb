class Item
  def initialize(publish_date:)
    @publish_date = publish_date
    @archived = false
    @id = id || rand(1000)
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
    @author
    author.add_item(self)
  end

  def label=(label)
    return if @label == label

    @label = label
    label&.add_item(self)
  end

  private

  def can_be_archived?
    @publish_date < (Time.now - (10 * 365 * 24 * 60 * 60)).strftime('%Y-%m-%d')
  end
end
