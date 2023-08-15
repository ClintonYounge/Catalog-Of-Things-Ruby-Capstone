require_relative 'item'

class Book < Item

    attr_accessor :publisher, :cover_state, :title

    def initialize(publisher, cover_state, publish_date, archived, genre, author, label, title)
        super(publish_date, archived, genre, author, label )
        @title = title
        @publisher = publisher
        @cover_state = cover_state
    end
end