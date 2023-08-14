class Item
  def initialize(title: 'unknown', genre: 'unknown', author: 'unknown', label: 'unknown',
                 publish_date: 'unknown')
    @title = title
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = archived
    @id = id || rand(1000)
  end

  def can_be_archived?
    @publish_date < (Time.now - (10 * 365 * 24 * 60 * 60)).strftime('%Y-%m-%d')
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
