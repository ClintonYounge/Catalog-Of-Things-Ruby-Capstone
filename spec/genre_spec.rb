require_relative '../genre'
require_relative '../music_album'

describe Genre do
  before :each do
    @genre = Genre.new('Rock')
    @album = MusicAlbum.new('The Wall', '1979-11-30', on_spotify: true)
  end

  it 'should have a name' do
    expect(@genre.name).to eq('Rock')
  end

  it 'should have an empty items array' do
    expect(@genre.items).to eq([])
  end

  it 'should have an album added to items array' do
    @genre.add_item(@album)
    expect(@genre.items).to eq([@album])
  end

  it 'should have the added album properties' do
    @genre.add_item(@album)
    expect(@genre.items[0].title).to eq('The Wall')
    expect(@genre.items[0].publish_date).to eq('1979-11-30')
    expect(@genre.items[0].on_spotify).to eq(true)
  end
end
