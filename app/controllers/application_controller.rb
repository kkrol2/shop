class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  helper_method :current_buyer, :current_order,:reset_order
  

  def current_buyer
    if session[:buyer].nil?
      @buyer = Buyer.new
      @buyer.save
      session[:buyer] = @buyer.id
    end

    Buyer.find(session[:buyer])
    
  end

  def current_order

      if session[:order].nil?

            buyer = current_buyer
            order = buyer.orders.build
            order.save
            logger.debug "Buyer:"+buyer.to_s
            logger.debug "Order:"+order.to_s
            session[:order] = order.id

        
      end
      Order.find(session[:order]) 
    end

    def reset_order
      session[:order] = nil
    end

    def reset_buyer
      session[:buyer] = nil
    end




  protected

   def layout_by_resource
    if devise_controller?
      "admin"
    else
      "standard"
    end
  end

  def after_sign_in_path_for(resource)
    '/admins'
  end

  

end
