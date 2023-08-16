require_relative '../models/label'

describe Label do
    describe '#add_item' do
        let(:label){Label.new('Ruby', 'red')}

        it 'Adds an object to the label if its an instance of Item class' do
            item = Item.new('2012-12-12', 'Ruby')
            label.add_item(item)
            expect(label.items).to include(item)
        end

        it 'Does not add an object to the label if it already exist' do
            item = Item.new('2012-12-12', 'Ruby')
            label.add_item(item)
            label.add_item(item)
            expect(label.items.count(item)).to eq(1)
        end

        it 'Not add an object to the label if its not an instance of Item class' do
            item = [1,2,3]
            label.add_item(item)
            expect(label.items).to be_empty
        end
    end
end