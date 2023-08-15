require 'securerandom'

class Item
  attr_accessor :label, :genre, :author
  attr_reader :id, :published_date, :archived

  def initialize(published_date:, label: 'Unknown', genre: 'Unknown', author: 'Unknown')
    @id = SecureRandom.uuid
    @label = label
    @genre = genre
    @author = author
    @published_date = published_date
    @archived = false
    move_to_archive
  end

  def can_be_archived?
    (Time.now - DateTime.parse(@published_date).to_time) > 10 * 365 * 24 * 60 * 60 # 10 years in seconds
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
