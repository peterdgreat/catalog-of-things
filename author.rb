class Author
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
    @id = Random.rand(1..1_000_000)
  end
end
