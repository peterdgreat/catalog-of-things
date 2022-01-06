require './books_manager'
require './labels_manager'

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
    @books_manager = BooksManager.new
    @labels_manager = LabelsManager.new
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

      menu_choice(option)
    end
  end

  def menu_choice(option)
    if option <= '6'
      choices_pt1(option)
    else
      choices_pt2(option)
    end
  end

  def choices_pt1(option)
    case option
    when '1'
      @books_manager.list_all_books
    when '2'
      puts 'Listing all music albums'
      # @var = MusicAlbum.new(Author, Title)
      # @var.list
    when '3'
      puts 'Listing all movies'
    when '4'
      puts 'Listing of games'
    when '5'
      puts 'Listing all genres'
    when '6'
      @labels_manager.list_all_labels
    else
      puts 'Not a valid option'
    end
  end

  def choices_pt2(option)
    case option
    when '7'
      puts 'Listing all authors'
    when '8'
      puts 'Listing all sources'
    when '9'
      @books_manager.add_book
    when '10'
      puts 'Adding a music album'
    when '11'
      puts 'Adding a movie'
    when '12'
      puts 'Adding a game'
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
