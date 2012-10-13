class CategoriesController  < ApplicationController
	layout 'standard'
	def index
		@categories = Category.all
	
	end

	def show
		@category = Category.find_by_name(params[:id])
	end

	def title
		'Category' 
	end

end