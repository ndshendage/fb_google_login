class Category < ApplicationRecord
	has_and_belongs_to_many :books
    validates :name, presence: true
    validates :category_ids, presence: true

    
	def self.search_by_name(name)
		where('name LIKE ?', "%#{name}%")
	end
end
