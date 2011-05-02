class ApplicationController < ActionController::Base

  protect_from_forgery
  
  def find_order
    if session[:order]
      @order = Order.find_by_id(session[:order], :include => :line_items)
    else
      @order = Order.create!(:branch => "temp", :contact => "temp")
      session[:order] = @order.id
    end
  end
  
end