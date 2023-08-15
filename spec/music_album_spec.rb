require_relative '../music_album'

RSpec.describe MusicAlbum do
    let(:music_album) { MusicAlbum.new(title: 'Album 1', publish_date: '2022-01-01', on_spotify: true) }
  
    describe '#can_be_archived?' do
      it 'returns true if publish date is older than 10 years and on_spotify is true' do
        expect(music_album.can_be_archived?).to be true
      end
  
      it 'returns false if publish date is not older than 10 years' do
        music_album.instance_variable_set('@publish_date', '2023-01-01')
        expect(music_album.can_be_archived?).to be false
      end

      it 'returns false if on_spotify is true' do
        music_album.instance_variable_set('@on_spotify', true)
        expect(music_album.can_be_archived?).to be true
      end
  
      it 'returns false if on_spotify is false' do
        music_album.instance_variable_set('@on_spotify', false)
        expect(music_album.can_be_archived?).to be false
      end
    end
  end
  