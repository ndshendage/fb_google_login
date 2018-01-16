class Category < ApplicationRecord
	has_and_belongs_to_many :books
    validates :name, length: { minimum: 3, message: 'minimum 4 characters'}
    validates :description, length: {minimum: 10, message: 'minimum 10 characters'}
    
	def self.search_by_name(name)
		where('name LIKE ?', "%#{name}%")
	end
end
