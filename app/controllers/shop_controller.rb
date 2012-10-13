class ShopController < ApplicationController
	layout 'standard'
	def index
		@products = Product.all
  
	end

	def title
		'Shop' 
	end

	
end