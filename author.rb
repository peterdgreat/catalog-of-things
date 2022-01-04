class Author
  attr_reader :id
  attr_accessor :name, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = Random.rand(1..1_000_000)
  end
end
