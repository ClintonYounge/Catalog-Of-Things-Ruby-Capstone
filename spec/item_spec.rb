require_relative '../item'
require_relative '../author'
require 'date'

describe Item do
  before :each do
    @item = Item.new(Date.today - 10_000)
  end

  it 'should have a published date' do
    expect(@item.published_date).to eq(Date.today - 10_000)
  end

  it 'should have an empty author' do
    expect(@item.author).to eq(nil)
  end

  it 'should have an author' do
    author = Author.new('Clinton', 'Younge')
    author.add_item(@item)
    expect(@item.author.first_name).to eq('Clinton')
    expect(@item.author.last_name).to eq('Younge')
  end

  it 'should have a published date' do
    expect(@item.published_date).to eq(Date.today - 10_000)
  end

  it 'can be archived should return true' do
    item = Item.new(Date.today - 10_000)
    expect(item.test_can_be_archived).to eq(true)
  end

  it 'can be archived should return false' do
    item = Item.new(Date.today - 1_000)
    expect(item.test_can_be_archived).to eq(false)
  end
end


# item = Item.new(Date.today - 1_000)
# puts "Item can be archived: #{item.test_can_be_archived}"
