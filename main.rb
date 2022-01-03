class App
  def initialize
    @options = {
      '1' => 'List all books',
      '2' => 'List all music albums',
      '3' => 'List all movies',
      '4' => 'List of games',
      '5' => 'List all genres',
      '6' => 'List all labels',
      '7' => 'List all authors',
      '8' => 'List all sources',
      '9' => 'Add a book',
      '10' => 'Add a music album',
      '11' => 'Add a movie',
      '12' => 'Add a game',
      '0' => 'Save and exit'
    }
  end

  def run
    puts 'Catalog of my things project'

    loop do
      puts ''
      puts 'Please choose an option by eterin a number:'
      @options.each { |key, value| puts "#{key}) #{value}" }
      option = gets.chomp
      if option == '0'
        save_and_exit
        break
      end

      menu_choice option
    end
  end

  def menu_choice(option)
    case option
    when '1'
      'Listing all books'
      # @var = Books.new(Author, Title)
      # @var.list
    when '2'
      'Listing all music albums'
      # @var = MusicAlbum.new(Author, Title)
      # @var.list
    when '3'
      'Listing all movies'
    when '4'
      'Listing of games'
    when '5'
      'Listing all genres'
    when '6'
      'Listing all labels'
    when '7'
      'Listing all authors'
    when '8'
      'Listing all sources'
    when '9'
      'Adding a book'
    when '10'
      'Adding a music album'
    when '11'
      'Adding a movie'
    when '12'
      'Adding a game'
    else
      puts 'Not a valid option'
    end
  end

  def save_and_exit
    'Saving ...'
  end
end

def main
  app = App.new
  app.run
end

main
