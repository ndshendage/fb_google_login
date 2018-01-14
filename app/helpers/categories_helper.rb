module CategoriesHelper
	def get_books_name(category)
		category.books.map(&:name).join(', ')
    end
end
