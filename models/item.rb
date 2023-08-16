require 'date'
class Item
  attr_accessor :publish_date, :archived, :genre, :author, :label, :id

  def initialize(publish_date, label)
    @publish_date = publish_date
    @archived = false
    @id = Random.rand(1..10_000)
    @label = label
  end

  def can_be_archived?
    return false if @publish_date.nil?

    (Date.today - @publish_date).to_i >= 3650
  end

  def move_to_archive
    self.archived = can_be_archived?
  end
end
