class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  helper_method :current_buyer

  def current_buyer
    if session[:buyer] is nil
      @buyer = Buyer.new
      session[:buyer] = @buyer
    end

    session[:buyer]
    
  end


  protected

   def layout_by_resource
    if devise_controller?
      "standard"
    else
      "standard"
    end
  end

  def after_sign_in_path_for(resource)
    '/admins'
  end

  

end
