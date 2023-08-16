require_relative '../genre'

RSpec.describe Genre do
  let(:genre) { Genre.new(name: 'Rock') }

  describe '#add_item' do
    it 'adds the item to the genre and sets the genre property of the item' do
      item = double('Item')
      expect(item).to receive(:genre=).with(genre)

      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
