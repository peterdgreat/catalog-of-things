require 'date'

class Item
  attr_reader :id
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date:, archived: false)
    @id = Random.rand(1..1_000_000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end


  def can_be_archived
    current_date = Date.today
    current_date.year - publish_date.year > 10
  end
end
