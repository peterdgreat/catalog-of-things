require 'json'
require_relative 'author'
class AuthorManager
  attr_reader :authors

  def initialize
    @authors = []
  end

  def add_author
    puts 'First lets let get the author name'
    puts ''
    puts 'First name'
    first_name = gets.chomp
    puts 'Last name'
    last_name = gets.chomp
    @authors.push(Author.new(first_name, last_name))
  end

  def list_authors
    puts 'Here are all the authors'
    add_author
    @authors.each do |author|
      puts author.to_json
    end
  end

  def store_authors
    File.write('author.json', JSON.pretty_generate(@authors), mode: 'w')
  end

  def read_author
    JSON.parse(File.read('author.json')) if File.exist?('author.json')
  end
end
