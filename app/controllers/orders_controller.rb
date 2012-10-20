class OrdersController < ApplicationController
	

	def index
		@order = current_order()
    @price = 0
    @order.orderItems.each do |item|
      @price += item.quantity * item.product.price
    end
	end


  	def create
  		product = Product.find(params[:id])
  		order = current_order()
      found = false
      order.orderItems.map! do |orderItem|
        if orderItem.product.id == product.id
          orderItem.quantity+=1
          orderItem.update_attributes(params[:orderItem])
          found = true
        end
        orderItem
      end
      if !found
  		  order_item = order.orderItems.build
  		  order_item.product = product
  		  order_item.quantity = 1
      end
  		order.update_attributes(params[:order])
  		redirect_to '/orders/'
  	end

    def pay
      @buyer = current_buyer
      if !@buyer.firstname.nil?
        realise_buy
        render :action => 'complete'
      end
    end

    def complete
      buyer = current_buyer
      if buyer.update_attributes(params[:buyer])
         realise_buy
         @buyer = buyer
      else
         render :action => 'pay'
      end
    end

    def realise_buy
      order = current_order
      order.confirmed = true
      order.update_attributes(params[:order])
      reset_order
    end






end