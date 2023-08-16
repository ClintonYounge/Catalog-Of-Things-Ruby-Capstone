require 'securerandom'
require 'date'

class Item
  attr_accessor :label, :genre, :author
  attr_reader :id, :published_date, :archived

  def initialize(published_date:, label id: nil)
    @id = id || SecureRandom.uuid
    @label = label
    @genre = nil
    @author = nil
    @published_date = published_date
    @archived = false
    move_to_archive
  end

  def can_be_archived?
    return false if @published_date.nil?

    published_date = DateTime.parse(@published_date)
    published_date < DateTime.now - 30
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
