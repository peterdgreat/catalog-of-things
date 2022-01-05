require 'json'
require './book'

class BooksManager
  attr_reader :books

  def initialize
    books = File.read('./data/books.json')
    @books = books == '' ? [] : convert_hashs_to_books(JSON.parse(books))
  end

  def add_book
    puts 'Enter publisher'
    publisher = gets.chomp
    puts 'Enter cover state'
    cover_state = gets.chomp
    puts 'Enter publish date'
    publish_date = gets.chomp
    puts 'Enter Y if the books is archived N if not archived '
    archived = gets.chomp
    is_archived = archived.downcase == 'y'
    book = Book.new(publisher, cover_state, publish_date, archived: is_archived)
    @books.push(book)
    save_books
  end

  def list_all_books
    @books.each_with_index do |b, i|
      puts "
       #{i}) Publisher: #{b.publisher},
        Cover State: #{b.cover_state},
        Publish Date: #{b.publish_date},
        Archived : #{b.archived}
        "
    end
  end

  def save_books
    hash_arr = []
    @books.each do |b|
      hash = { publisher: b.publisher, cover_state: b.cover_state, publish_date: b.publish_date,
               archived: b.archived }
      hash_arr.push(hash)
    end
    json = JSON.generate(hash_arr)
    File.write('./data/books.json', json)
  end

  private

  def convert_hashs_to_books(hashes)
    books = []
    hashes.each do |h|
      b = Book.new(h['publisher'], h['cover_state'], h['publish_date'], archived: h['archived'])
      books << b
    end
    books
  end
end
