class CategoriesController  < ShopController

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