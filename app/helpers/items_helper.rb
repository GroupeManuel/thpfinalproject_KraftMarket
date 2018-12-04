module ItemsHelper
	
	def category_list
		category_list = []
		Category.all.each do |cat|
			category_list << cat.category_name
		end
		return category_list
	end

end
