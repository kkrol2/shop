class ShopController < ApplicationController
	
	def index
		@products = Product.all
  
	end

	def easy
		render :text => "that was easy"
	end
end