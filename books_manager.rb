require 'json'
require './book'
require './label'

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
    puts 'Enter is book archived [Y/N] ?'
    archived = gets.chomp
    is_archived = archived.downcase == 'y'
    book = Book.new(publisher, cover_state, publish_date, archived: is_archived)
    add_label book
    @books.push(book)
    save_books
  end

  def add_label book
    puts 'Enter if you want to add a label to this book [Y/N] ?'
    reponse = gets.chomp
    book.add_label if reponse.downcase == 'y'
  end

  def list_all_books
    @books.each_with_index do |b, i|
      puts "
       #{i}) 
            Publisher: #{b.publisher},
            Cover State: #{b.cover_state},
            Publish Date: #{b.publish_date},
            Archived : #{b.archived}
        "
        show_label b.label
    end
  end



 

  def save_books
    hash_arr = convert_books_to_hashes
    json = JSON.generate(hash_arr)
    File.write('./data/books.json', json)
  end

  private

  def convert_hashs_to_books(hashes)
    books = []
    hashes.each do |h|
      b = Book.new(h['publisher'], h['cover_state'], h['publish_date'], archived: h['archived'])
      l = convert_hash_to_label h['label']
      b.add_label(l)
      books << b
    end
    books
  end

  def convert_hash_to_label h
    l = Label.new(h['title'], h['color'],h['id'])
  end

  def convert_books_to_hashes
    hash_arr = []
    @books.each do |b|
      hash = { publisher: b.publisher, cover_state: b.cover_state, publish_date: b.publish_date,
               archived: b.archived, label: b.label ? {id: b.label.id, title: b.label.title, color: b.label.color} : nil }
      hash_arr.push(hash)
    end
    hash_arr
  end

  def show_label l
    if l.title 
      print "
            Lable:
              ID: #{l.id}, 
              Title: #{l.title},
              Color: #{l.color}
      "
    end
  end
end
