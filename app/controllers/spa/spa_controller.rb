class Spa::SpaController < OrdersController
	layout 'spa'

	def index
	end

	def getAllData
		j = ActiveSupport::JSON
		array = Array.new
		array[0]= Product.all
		array[1]= Category.all
		respond_to do |format|
    		format.json { render :json => j.encode(array) }
  		end
	end

	def getBuyer
		j = ActiveSupport::JSON
		data = [current_buyer(),current_order().orderItems]
		respond_to do |format|
    		format.json { render :json => j.encode(data) }
  		end
	end

	def addToCart
		create()
	end


	
end