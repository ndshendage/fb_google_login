module BooksHelper
	def get_category_names(book)
		book.categories.map(&:name).join(', ')
    end
end
