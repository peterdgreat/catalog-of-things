require_relative 'game_manager'
require_relative 'author'
require_relative 'author_manager'
class App
  def initialize
    @game_manager = GameManager.new
    @game_manager.read_games
    @author_manager = AuthorManager.new
    @author_manager.read_author
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
      option = gets.chomp.to_i
      if option.zero?
        save_and_exit
        break
      end

      menu_choice(option)
    end
  end

  def menu_choice(option)
    if option <= 6
      choices_pt1(option)
    else
      choices_pt2(option)
    end
  end

  def choices_pt1(option)
    case option
    when 1
      puts 'Listing all books'
      # @var = Books.new(Author, Title)
      # @var.list
    when 2
      puts 'Listing all music albums'
      # @var = MusicAlbum.new(Author, Title)
      # @var.list
    when 3
      puts 'Listing all movies'
    when 4
      puts 'Listing all games'
      @game_manager.list_games
    when 5
      puts 'Listing all genres'
    when 6
      puts 'Listing all labels'
    else
      puts 'Not a valid option'
    end
  end

  def choices_pt2(option)
    case option
    when 7
      puts 'Not Available'
      # @author_manager.list_authors
    when 8
      puts 'Listing all sources'
    when 9
      puts 'Adding a book'
    when 10
      puts 'Adding a music album'
    when 11
      puts 'Adding a movie'
    when 12
      puts 'Adding a game'
      @game_manager.add_game
    else
      puts 'Not a valid option'
    end
  end

  def save_and_exit
    @game_manager.store_games
    @author_manager.store_authors
  end
end

def main
  app = App.new
  app.run
end

main
