class ShopController < ApplicationController

	def index
		@products = Product.all
  
	end

	def title
		'Shop' 
	end

	
end