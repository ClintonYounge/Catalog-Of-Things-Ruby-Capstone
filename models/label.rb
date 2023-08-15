class label
    attr_reader :id, :title, :color, :items
    def initialize(title, color, id = nil)
        @id = id || rand(1...10000)
        @title = title
        @color = color    
        @items = []
    end
end