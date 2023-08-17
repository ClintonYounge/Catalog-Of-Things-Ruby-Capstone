require_relative '../models/book'
require_relative '../models/label'
describe Label do
  before(:each) do
    @books = []
    @labels = []

    @label = Label.new('Title1', 'Color1')
    @labels << @label

    @book = Book.new(@label, '2021-01-01', 'Publisher1', 'Good')
    @books << @book
  end
  describe '#add_item' do
    it 'Adds an object to the label if its an instance of Item class' do
      item = Item.new('2012-12-12')
      @label.add_item(item)
      expect(@label.items).to include(item)
    end

    it 'Does not add an object to the label if it already exist' do
      item = Item.new('2012-12-12')
      @label.add_item(item)
      @label.add_item(item)
      expect(@label.items.count(item)).to eq(1)
    end

    it 'Not add an object to the label if its not an instance of Item class' do
      item = [1, 2, 3]
      @label.add_item(item)
      expect(@label.items).to be_empty
    end
  end
end
