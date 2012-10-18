class BuyersController < ApplicationController
	layout 'standard'

	def index
		@buyers = Buyer.all
	
	end
end