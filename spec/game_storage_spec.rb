require_relative '../game_storage'

describe GameStorage do
  describe '#save_authors_json' do
    it 'saves the authors to a json file' do
      game_storage = GameStorage.new([])
      game_storage.save_authors_json
      expect(File.exist?('authors.json')).to eq(true)
      File.delete('authors.json')
    end
  end

  describe '#load_authors_json' do
    it 'loads the authors from a json file' do
      game_storage = GameStorage.new([])
      game_storage.save_authors_json
      game_storage.load_authors_json
      expect(game_storage.authors).to eq([])
      File.delete('authors.json')
    end
  end
end
