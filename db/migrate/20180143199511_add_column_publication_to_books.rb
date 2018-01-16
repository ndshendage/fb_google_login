class AddColumnPublicationToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :publication, :string
  end
end
