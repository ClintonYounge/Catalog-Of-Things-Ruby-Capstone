require_relative '../music_album'
require_relative '../genre'

describe MusicAlbum do
  before :each do
    @album = MusicAlbum.new('The Wall', '1979-11-30', on_spotify: true)
    @genre = Genre.new('Rock')
  end

  it 'should have a title' do
    expect(@album.title).to eq('The Wall')
  end

  it 'should have a publish date' do
    expect(@album.publish_date).to eq('1979-11-30')
  end

  it 'should have a on_spotify property' do
    expect(@album.on_spotify).to eq(true)
  end

  it 'should have an empty genre' do
    expect(@album.genre).to eq(nil)
  end

  it 'should have a genre' do
    @genre.add_item(@album)
    expect(@album.genre.name).to eq('Rock')
  end
end
