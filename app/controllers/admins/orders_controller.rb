class Admins::OrdersController  < Admins::AdminsController


  def index
    @orders = Order.where(:confirmed => true)
  end




end