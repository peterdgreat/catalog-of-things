require './item';

class Book < Item
    def initialize  publisher, cover_state
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
        'can'
    end
end