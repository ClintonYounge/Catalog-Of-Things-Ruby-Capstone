require_relative 'item'

class MusicAlbum < Item
  attr_accessor :title, :published_date, :on_spotify

  def initialize(title: 'unknown', published_date: nil, on_spotify: false)
    super(published_date: published_date)
    @title = title
    @published_date = published_date
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end