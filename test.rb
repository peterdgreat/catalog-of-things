require './item'
require './book'
require './books_manager'
require './label'
require './labels_manager'

# i = Item.new(publish_date:'2021-1-1');
# puts i

# b = Book.new('dyary_publisher', 'bad','2021-1-1')
# puts b.publisher
# puts b.can_be_archived?

# l = Label.new('title of label', 'red')

# puts l

# l.add_item i

# puts l.items[0].publish_date
# puts l.color

# b.add_label(l)

# bm = BooksManager.new
# bm.add_book()
# bm.add_book()
# puts bm.books[0].publish_date

# bm.list_all_books

lm = LabelsManager.new
lm.add_label

# lm.list_all_labels

# bm.save_books
