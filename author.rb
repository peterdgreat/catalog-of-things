class Author
  attr_reader :id
  attr_accessor :name, :items, :last_played_at, :publish_date, :archived

  def initialize(first_name, last_name, publish_date, archived: false)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = Random.rand(1..1_000_000)
    super(publish_date, archived)
  end

  def add_item(item)
    @items.push(item)
    item.add_author(self)
  end
end
