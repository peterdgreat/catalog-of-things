require 'json'
require './genre'

class GenreHandler
  attr_reader :genres

  def initialize
    @genres = []
  end

  def save
    File.write('data/genre.json', JSON.generate(@genres.map(&:to_json))) unless @genres.empty?
  end

  def load
    file = 'data/genre.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).map do |data|
        @genres.push(Genre.new(id: data['id'], name: data['name']))
      end
    else
      []
    end
  end

  def add_genre(genre)
    @genres.push(genre)
  end

  def create_genre
    puts ''
    puts 'Creating Genre...'
    print 'Name: '
    name = gets.chomp
    genre = Genre.new(id: nil, name: name)
    @genres.push(genre)
    puts 'Genre created!'
  end
end
