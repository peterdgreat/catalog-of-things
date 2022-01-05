require './game'
require './item'
describe Game do
  it 'should initialize with an instance of game' do
    game = Game.new(true, '2018-01-01', '2018-01-01')
    expect(game).to be_a(Game)
  end
  it 'should have archive default to false' do
    game = Game.new(true, '2018-01-01', '2018-01-01')
    expect(game.archived).to eq(false)
  end
  it 'should have multiplayer based on input' do
    game = Game.new(true, '2018-01-01', '2018-01-01')
    expect(game.multi_player).to eq(true)
  end
  it 'should have publish date based on input' do
    game = Game.new(true, '2018-01-01', '2018-01-01')
    expect(game.publish_date).to eq('2018-01-01')
  end
  it 'should have last played at based on input' do
    game = Game.new(true, '2018-01-01', '2018-01-01')
    expect(game.last_played_at).to eq('2018-01-01')
  end
end
