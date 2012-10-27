class ProductsController  < ShopController


	def show
		@product = Product.find(params[:id])
	#	@product.build_category
		render :template => 'products/show'
	end

	def title
		'Produkt'
	end

		 

	def index
		
		@q = Product.search(params[:q])
  
	end

	
end