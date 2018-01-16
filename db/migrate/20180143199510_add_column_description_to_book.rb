class AddColumnDescriptionToBook < ActiveRecord::Migration[5.0]
  def change
  	add_column :books, :description, :text
  	add_column :books, :price, :float
  	add_column :books, :author_name, :string
  	add_column :books, :edition, :string
  	add_column :books, :published_date, :date
  end
end
