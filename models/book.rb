require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(inputs)
    super(inputs[:published_date], inputs[:label])
    @publisher = inputs[:publisher]
    @cover_state = inputs[:cover_state]
  end

  def can_be_archived?()
    super || (@cover_state == 'Bad')
  end
end
