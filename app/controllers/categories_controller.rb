class CategoriesController  < ApplicationController
	layout 'standard'
	def show
		@categories = Category.all
	
	end
end