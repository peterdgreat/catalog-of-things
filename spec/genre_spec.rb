require_relative '../genre'
require_relative '../item'

describe 'Genre class tests' do
  before :each do
    @genre = Genre.new(id: nil, name: 'Pop')
    @item = Item.new(id: nil, publish_date: '2022-01-06')
  end

  describe 'Fundamental checks' do
    it 'check instance' do
      expect(@genre).to be_instance_of(Genre)
    end
  end

  describe 'Unit tests' do
    it 'check if id is not nil' do
      expect(@genre.id.nil?).to be_falsey
    end

    it 'check if an item is added to the array of items from genre' do
      @genre.add_item(@item)
      expect(@genre.items).to match_array([@item])
    end
  end
end
