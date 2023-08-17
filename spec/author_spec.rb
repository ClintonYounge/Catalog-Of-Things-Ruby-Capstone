require_relative '../author'
require_relative '../game'

describe Author do
  before :each do
    @author = Author.new('Clinton', 'Younge')
    @game = Game.new('Call of Duty', '2022-10-10', '1990-11-11')
  end

  it 'should have a first name' do
    expect(@author.first_name).to eq('Clinton')
  end

  it 'should have a last name' do
    expect(@author.last_name).to eq('Younge')
  end

  it 'shoul have an empty items array' do
    expect(@author.items).to eq([])
  end

  it 'should have a game added to items array' do
    @author.add_item(@game)
    expect(@author.items).to eq([@game])
  end

  it 'should have the added game properties' do
    @author.add_item(@game)
    expect(@author.items[0].multiplayer).to eq('Call of Duty')
    expect(@author.items[0].last_played_at).to eq('2022-10-10')
    expect(@author.items[0].published_date).to eq('1990-11-11')
  end
end
