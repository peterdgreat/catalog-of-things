require_relative 'item'
require_relative 'store_game'
class Game < Item
  attr_accessor :multi_player, :last_played_at, :publish_date, :archived, :games

  def initialize(multi_player, last_played_at, publish_date, archived: false)
    @multi_player = multi_player
    @last_played_at = last_played_at
    @games = []
    super(id: id, publish_date: publish_date, archived: archived)
  end

  def can_be_archived
    current_date = Date.today
    super && last_played_at.year - current_date.year > 2
  end

  def add_game(game)
    @games.push(game)
  end

  def list_games
    @games.each do |game|
      puts game
    end
  end

  def to_json(*_args)
    {
      id: id,
      multi_player: @multi_player,
      last_played_at: @last_played_at,
      publish_date: @publish_date,
      archived: @archived,
      games: @games
    }.to_json
  end
end
