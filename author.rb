class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = Random.rand(1..1_000_000)
  end

  def add_item(item)
    @items.push(item)
    item.add_author(self)
  end

  def list_authors
    @items.each do |item|
      puts item
    end
  end

  def to_json(*_args)
    {
      id: @id,
      name: "#{@first_name} #{@last_name}",
      items: @items
    }.to_json
  end
end
