require_relative 'item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify, :archived

  def initialize(publish_date:, archived: false, on_spotify: false)
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
    {
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'source' => @source,
      'label' => @label,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'on_spotify' => @on_spotify
    }
  end
end
