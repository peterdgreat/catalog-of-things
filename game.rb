class Game
  attr_accessor :multi_player, :last_played_at

  def initialize(multi_player, last_played_at)
    @multi_player = multi_player
    @last_played_at = last_played_at
  end
end
