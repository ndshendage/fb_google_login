namespace :as  do
	task :setup => :environment do
		(1..10).each do |i|
			b_name = 'book' + i.to_s
			c_name = 'category' + i.to_s
			book = Book.create(name: b_name)
			category = Category.create(name: c_name)
		end
	end
end