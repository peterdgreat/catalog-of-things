require 'json'
def store_games(games)
  File.write('games.json', JSON.pretty_generate(games), mode: 'w')
end
