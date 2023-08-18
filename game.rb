require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :published_date

  def initialize(game_name, last_played_at, published_date = nil)
    super(published_date)
    @multiplayer = game_name
    @last_played_at = last_played_at
  end

  def test_can_be_archived
    can_be_archived?
  end

  private

  def can_be_archived?
    super && (Date.today - @last_played_at).to_i > 730
  end
end
