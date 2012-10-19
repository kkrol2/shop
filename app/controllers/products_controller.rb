class ProductsController  < ApplicationController


	def show
		@product = Product.find(params[:id])
	#	@product.build_category
		render :template => 'products/show'
	end

	def title
		'Produkt'
	end

	
end