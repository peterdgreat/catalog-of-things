class Item
  attr_reader id
  attr_accessor genre, author, source, label, publish_date

  def initialize(genre:, author:, source:, label:, publish_date:, archived:)
    @id = Random.rand(1..1_000_000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived
    current_date = Date.today
    current_date.year - publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived
  end
end
