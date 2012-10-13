class ProductsController  < ApplicationController
	layout 'standard'
	

	def show
		@product = Product.find(params[:id])
		@title = 'dsadsad'
	#	@product.build_category
		render :template => 'products/show'
	end

	def title
		'Produkt'
	end
end