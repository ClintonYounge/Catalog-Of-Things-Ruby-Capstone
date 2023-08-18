require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label

  def initialize(label, published_date = 'unknown', publisher = 'unknown', cover_state = 'unknown')
    super(published_date)
    @published_date = published_date
    @publisher = publisher
    @cover_state = cover_state
    @label = label
  end

  def can_be_archived?
    @cover_state == 'Bad' || (Date.today - Date.parse(@published_date)).to_i > 3650
  end
end
