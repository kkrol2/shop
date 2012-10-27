class ShopController < ApplicationController

	helper_method :getSearchObject

	def index
		@products = Product.last(10)
  
	end

	def search_advanced
	end

	def search	
		@q = Product.search(params[:q])
		@products = @q.result(:distinct => true).first(10)
	end

	def getSearchObject
		@q = Product.search(params[:q])
	end

	
end