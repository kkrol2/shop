class ProductsController  < ApplicationController
	layout 'standard'
	def show
		@product = Product.find(params[:id])
		@category_name =  @product.category
	#	@product.build_category
		render :template => 'products/show'
	end
end