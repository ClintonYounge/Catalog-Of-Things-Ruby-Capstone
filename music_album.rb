require_relative 'item'

class MusicAlbum < Item
  attr_accessor :title, :publish_date, :on_spotify

  def initialize(title, publish_date, on_spotify: false)
    super(publish_date)
    @title = title
    @publish_date = publish_date
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
