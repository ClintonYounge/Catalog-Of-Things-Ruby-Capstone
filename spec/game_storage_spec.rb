require_relative '../game_storage'

describe GameStorage do
  describe '#save_games_json' do
    it 'saves the games to a json file' do
      games = []
      game = Game.new('Halo', '2019-01-01')
      games << game
      subject.save_games_json(games)
      expect(File.exist?('games.json')).to be true
    end
  end

  describe '#load_games_json' do
    it 'loads the games from a json file' do
      games = []
      subject.load_games_json(games)
      expect(games.length).to be 1
    end
  end

  describe '#save_authors_json' do
    it 'saves the authors to a json file' do
      authors = []
      author = Author.new('John', 'Doe')
      authors << author
      subject.save_authors_json(authors)
      expect(File.exist?('authors.json')).to be true
    end
  end

  describe '#load_authors_json' do
    it 'loads the authors from a json file' do
      authors = []
      subject.load_authors_json(authors)
      expect(authors.length).to be 1
    end
  end
end
