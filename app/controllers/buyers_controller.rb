class BuyersController < ApplicationController


	def show
		@buyers = Buyer.all
	
	end
end