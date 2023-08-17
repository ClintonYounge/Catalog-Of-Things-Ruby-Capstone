require_relative '../music_album'

describe MusicAlbum do
  describe '#initialize' do
    it 'creates a music album with a title' do
      music_album = MusicAlbum.new(title: 'The Dark Side of the Moon')
      expect(music_album.title).to eq('The Dark Side of the Moon')
    end

    it 'creates a music album with a publish date' do
      music_album = MusicAlbum.new(publish_date: '1973-03-01')
      expect(music_album.publish_date).to eq('1973-03-01')
    end

    it 'creates a music album that is on Spotify' do
      music_album = MusicAlbum.new(on_spotify: true)
      expect(music_album.on_spotify).to eq(true)
    end
  end
end
