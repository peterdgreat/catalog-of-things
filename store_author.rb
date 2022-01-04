require 'json'
def store_author(author)
  File.write('author.json', JSON.pretty_generate(author), mode: 'w')
end
