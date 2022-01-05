require './author'
require './game'

describe Author do
  it 'should initialize with an instance of author' do
    author = Author.new('John', 'Doe')
    expect(author).to be_a(Author)
  end
  it 'should have first name based on input' do
    author = Author.new('John', 'Doe')
    expect(author.first_name).to eq('John')
  end
  it 'should have last name based on input' do
    author = Author.new('John', 'Doe')
    expect(author.last_name).to eq('Doe')
  end
  it 'should add item to items array' do
    author = Author.new('John', 'Doe')
    game = Game.new(true, '2018-01-01', '2018-01-01')
    author.add_item(game)
    expect(author.items).to include(game)
  end
end
