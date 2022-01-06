require 'json'
require_relative 'author'
class AuthorManager
  attr_accessor :authors

  def initialize
    @authors = []
  end

  def add_author
    puts 'First name'
    first_name = gets.chomp
    puts 'Last name'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author) unless @authors.include?(author)

    author
  end

  def list_authors
    # read_author.each do |author|
    #   puts author.to_json
    # end
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
