class Item
  def initialize(publish_date, archived: false, genre, author, label)
    @publish_date = publish_date
    @archived = false
    @id = Random.rand(1..10000)
    @genre = genre
    @author = author
    @label = label
  end
  
  def can_be_archived?
    @last_played_at < 10.year.ago
  end
  
  def move_to_archive
    self.archived = can_be_archived?
  end
end
