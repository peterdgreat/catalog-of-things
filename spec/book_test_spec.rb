require './book'

describe Book do
  context 'testing Book class' do
    book = Book.new('My Publisher', 'New', '2018-01-01')

    it 'should return 1My Publisher as a publisher' do
      expect(book.publisher).to eq 'My Publisher'
    end

    it 'should return New as a cover_satate' do
      expect(book.cover_state).to eq 'New'
    end

    it 'should return 2018-01-01 as a publish date' do
      expect(book.publish_date.to_s).to eq '2018-01-01'
    end

    it 'should return false as a return of can_be_archived? method' do
        expect(book.can_be_archived?).to eq false
      end
  end
end 