require_relative '../music_album'

describe 'MusicAlbum class tests' do
  before :each do
    @music_album = MusicAlbum.new(id: nil, publish_date: '1997-03-13', on_spotify: false)
  end

  describe 'Fundamental checks' do
    it 'check instance' do
      expect(@music_album).to be_instance_of(MusicAlbum)
    end

    it 'check if Item is his parent' do
      expect(@music_album).to be_kind_of(Item)
    end
  end

  describe 'Unit tests' do
    it 'check if id is not nil' do
      expect(@music_album.id.nil?).to be_falsey
    end

    it 'check if cant be archived' do
      @music_album.move_to_archive
      expect(@music_album.archived).to be_falsey
    end

    it 'check if can be archived, after making on_spotify = true' do
      @music_album.on_spotify = true
      @music_album.move_to_archive
      expect(@music_album.archived).to be_truthy
    end
  end
end
