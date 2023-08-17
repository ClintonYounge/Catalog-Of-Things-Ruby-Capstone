require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label

  def initialize(label, published_date = 'unknown', publisher = 'unknown', cover_state = 'unknown')
    super()
    @published_date = published_date
    @publisher = publisher
    @cover_state = cover_state
    @label = label
  end

  def can_be_archived?
    super || (@cover_state == 'Bad')
  end
end
