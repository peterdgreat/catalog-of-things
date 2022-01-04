require 'json'
require './music_album'

class MusicAlbumHandler
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

  def add_music_album(publish_date:, id: nil)
    @music_albums.push(MusicAlbum.new(id: id, publish_date: publish_date))
  end

  def translate_answer(ans)
    %w[yes y].include?(ans.downcase)
  end

  def create_music_album
    puts ''
    puts 'Creating Music Album...'
    print 'Published date: '
    publish_date = gets.chomp
    print 'On Spotify? [Y/N]: '
    on_spotify = gets.chomp
    print 'Archived? [Y/N]: '
    archived = gets.chomp
    music_album = MusicAlbum.new(id: nil, publish_date: publish_date, on_spotify: translate_answer(on_spotify))
    if translate_answer(archived)
      music_album.move_to_archive
      puts "It wasn't possible to archive this Music Album" if translate_answer(archived) != music_album.archived
    end
    @music_albums.push(music_album)
    puts 'Music Album created!'
  end
end
