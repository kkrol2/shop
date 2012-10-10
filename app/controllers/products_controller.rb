class ProductsController  < ApplicationController
	
	def show
		@product = Product.find(params[:id])
		render :text => @product.name
	end
end