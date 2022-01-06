require 'json'
require './music_album'
require './genre_handler'
require './translate'

class MusicAlbumHandler
  include Translate
  attr_reader :music_albums

  def initialize
    @music_albums = []
  end

  def save
    File.write('data/music_album.json', JSON.generate(@music_albums.map(&:to_json))) unless @music_albums.empty?
  end

  def load
    file = 'data/music_album.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).map do |data|
        @music_albums.push(MusicAlbum.new(id: data['id'], publish_date: data['publish_date']))
      end
    else
      []
    end
  end

  def add_music_album(music_album)
    @music_albums.push(music_album)
  end

  def create_music_album
    @genre_handler = GenreHandler.new
    @genre_handler.load
    puts ''
    puts 'Creating Music Album...'
    print 'Published date: '
    publish_date = gets.chomp
    print 'On Spotify? [Y/N]: '
    on_spotify = gets.chomp
    print 'Archived? [Y/N]: '
    archived = gets.chomp
    music_album = MusicAlbum.new(id: nil, publish_date: publish_date, on_spotify: translate_input(on_spotify))
    if translate_input(archived)
      music_album.move_to_archive
      puts "It wasn't possible to archive this Music Album" if translate_input(archived) != music_album.archived
    end
    puts ''
    @music_albums.push(music_album)
    puts 'Music Album created!'
  end

  def prompt_genre
    puts '1) Create a new genre for the music album'
    puts '2) List and use an existing genre'
    puts '3) Create music album without genre'
    option = gets.chomp
    case option
    when '1'
      puts 'asd'
    when '2'
      puts 'qwe'
    when '3'
      puts 'Creating Music Album without genre'
    else
      puts 'Invalid option, aborting genre creation'
    end
  end
end
