require './item';

class Book < Item
    def initialize  publisher, cover_state, genre, author, source, label, publish_date
        super(genre: genre, author: author,source: source, label: label, publish_date: publish_date)
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
        super.can_be_archived || @cover_state == 'bad'
    end
end