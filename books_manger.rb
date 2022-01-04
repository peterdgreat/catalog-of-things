class BooksManager
    def initialize
        @books = []
    end

    def add_book book
        @books.push(book)
    end

    def list_all_books
        @books.each_with_index do |b, i|
            puts " #{i}) Title:  #{b.label.title} Genre #{b.genre}, Publish Date: #{b.publish_date} "
        end
    end
end