class ProductsController < ApplicationController
  
  before_filter :find_order
  
  # GET /products
  # GET /products.xml
  def index
    @title = "Order Uniforms"
    @products = Product.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

end
