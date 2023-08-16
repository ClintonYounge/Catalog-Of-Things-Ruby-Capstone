require_relative '../game_methods'

describe GameMethods do
  describe '#list_games' do
    it 'should return a list of games' do
      game_methods = GameMethods.new
      games = [Game.new('Yes', Date.new(2019, 1, 1))]
      expect { game_methods.list_games(games) }.to output("Multiplayer: Yes. Last played at: 2019-01-01\n").to_stdout
    end

    it 'should return a message if no games are found' do
      game_methods = GameMethods.new
      games = []
      expect { game_methods.list_games(games) }.to output("No games found\n").to_stdout
    end
  end

  describe '#list_authors' do
    it 'should return a list of authors' do
      game_methods = GameMethods.new
      authors = [Author.new('John', 'Doe')]
      expect { game_methods.list_authors(authors) }.to output("First Name: John, Last Name: Doe\n").to_stdout
    end

    it 'should return a message if no authors are found' do
      game_methods = GameMethods.new
      authors = []
      expect { game_methods.list_authors(authors) }.to output("No authors found\n").to_stdout
    end
  end

  describe '#add_game' do
    it 'should add a game to the list of games' do
      game_methods = GameMethods.new
      games = []
      authors = []
      allow(game_methods).to receive(:gets).and_return('John', 'Doe', 'Yes', '2019-01-01')
      game_methods.add_game(games, authors)
      expect(games.length).to eq(1)
      expect(authors.length).to eq(1)
    end
  end
end