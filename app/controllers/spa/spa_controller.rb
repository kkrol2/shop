class Spa::SpaController < ApplicationController
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



	
end