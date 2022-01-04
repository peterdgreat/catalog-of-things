class Game < Item
  attr_accessor :multi_player, :last_played_at, :publish_date, :archived

  def initialize(multi_player, last_played_at, publish_date, archived: false)
    @multi_player = multi_player
    @last_played_at = last_played_at
    super(publish_date, archived)
  end

  def can_be_archived?
    current_date = Date.today
    super.can_be_archived && last_played_at.year - current_date.year > 2
  end
end
