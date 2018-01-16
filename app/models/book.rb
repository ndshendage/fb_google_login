class Book < ApplicationRecord
	has_and_belongs_to_many :categories
    validates :name, :author_name, length: { minimum: 4, message: 'minimum 4 characters'}
    validates :description, length: {minimum: 10, message: 'minimum 10 characters'}
    validates :price, numericality: { only_integer: false, greater_than: 0 }
    

	#mysql queries
	def self.search_by_name(column_name, term)
		where("#{column_name} LIKE ?", "%#{term}%")
	end
end
