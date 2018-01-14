class Book < ApplicationRecord
	has_and_belongs_to_many :categories
    validates :name, presence: true


	#mysql queries
	def self.search_by_name(column_name, term)
		where("#{column_name} LIKE ?", "%#{term}%")
	end
end
