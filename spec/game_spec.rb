require_relative '../game'
require_relative '../author'

describe Game do
  before :each do
    @game = Game.new('Call of Duty', '2022-10-10', '1990-11-11')
    @author = Author.new('Clinton', 'Younge')
  end

  it 'should have a multiplayer' do
    expect(@game.multiplayer).to eq('Call of Duty')
  end

  it 'should have a last played at' do
    expect(@game.last_played_at).to eq('2022-10-10')
  end

  it 'should have a published date' do
    expect(@game.published_date).to eq('1990-11-11')
  end

  it 'should have an empty author' do
    expect(@game.author).to eq(nil)
  end

  it 'should have an author' do
    @author.add_item(@game)
    expect(@game.author.first_name).to eq('Clinton')
    expect(@game.author.last_name).to eq('Younge')
  end
end
