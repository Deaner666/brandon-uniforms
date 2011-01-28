class PagesController < ApplicationController
  
  def index
    @title = "Order Drinks"
    @order = Order.new
    @products = Product.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @order }
    end
  end
  
end
