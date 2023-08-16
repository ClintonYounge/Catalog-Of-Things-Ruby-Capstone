require_relative '../game'

describe Game do
  before :each do
    @game = Game.new('Mario Kart', '2019-11-11')
  end

  it 'should have a multiplayer' do
    expect(@game.multiplayer).to eq('Mario Kart')
  end

  it 'should have a last played at' do
    expect(@game.last_played_at).to eq('2019-11-11')
  end
end