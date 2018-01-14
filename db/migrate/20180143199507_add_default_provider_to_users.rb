class AddDefaultProviderToUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :provider, :string, :default => 'devise'
  end
end
