# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

categories = ['Ruby', 'Ruby on Rails', 'Javascript', 'Html', 'Css']
categories.each do |cat|
	category = Category.create(name: cat, description: "This category consist of #{cat} books")
end
book_data = YAML::load( File.open( Rails.root.to_s+"/config/data/seed_data.yml" ))["book"]
book_data.each do|book, options|
	Book.create(name: options['name'],
				author_name: options['author_name'],
				edition: options['edition'],
				price: options['price'],
				publication: options['publication'],
				description: options['description'],
				category_ids: options['category_ids'])
end