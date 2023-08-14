class Item
  def initialize(_title = 'unknown', genre = 'unknown', author = 'unknown', label = 'unknown', publish_date = 'unknown',
                 archived = false, id: nil)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
    @id = id || rand(1000)
  end

  def can_be_archived?
    @publish_date > '2013-01-01'
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
