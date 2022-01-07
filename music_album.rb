require_relative 'item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify, :archived

  def initialize(id:, publish_date:, archived: false, on_spotify: false)
    super(id: id, publish_date: publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "[Music Album] #{super} - On Spotify? #{@on_spotify}"
  end

  def to_json(_options = {})
    super.merge({
                  'on_spotify' => @on_spotify
                })
  end
end
