require 'json'
class AuthorManager
  def store_author(author)
    File.write('author.json', JSON.pretty_generate(author), mode: 'w')
  end

  def read_author
    JSON.parse(File.read('author.json')) if File.exist?('author.json')
  end
end
