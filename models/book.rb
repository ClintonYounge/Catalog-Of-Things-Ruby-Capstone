require_relative 'item'

class Book < Item

    attr_accessor :publisher, :cover_state, :title

    def initialize(inputs)
        super(inputs[:publish_date], inputs[:archived], inputs[:genre], inputs[:author], inputs[:label] )
        @title = inputs[:title]
        @publisher = inputs[:publisher]
        @cover_state = inputs[:cover_state]
    end

    def can_be_archived?()
        super || (@cover_state.downcase == 'bad')
    end
end

cc = Book.new(title: "fff", cover_state: "bad")
puts "#{cc.can_be_archived?}"