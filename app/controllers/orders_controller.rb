class OrdersController < ApplicationController  
  
  # GET /orders/1
  # GET /orders/1.xml
  def show
    @title = "Order summary"
    @order = Order.find(params[:id], :include => :line_items)
  end
  
  # GET /orders/new
  # GET /orders/new.xml
  def new
    @title = "Order Uniforms"
    @order = Order.new
    for product in Product.all
      @order.line_items.build(:product_id => product.id, :product_name => Product.find(product.id).name)
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => @order }
    end
  end
  
  # POST /orders  
  # POST /orders.xml 
  def create
    @order = Order.new(params[:order])
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to(order_path(@order),
                                  :notice => "Order was successfully created.") }
        format.xml { render :xml => @order, :status => :created, :location => @order }
      else
        ids = []
        for li in @order.line_items do
          ids << li.product_id
        end
        for product in Product.all
          unless ids.include?(product.id)
            @order.line_items.build(:product_id => product.id, :product_name => Product.find(product.id).name)
          end
        end
        flash.now[:alert] = "There was a problem with your order."
        format.html { render :action => "new" }
        format.xml { render :xml => @order.error, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @title = "Amend Order"
    @order = Order.find(params[:id])
    ids = []
    for li in @order.line_items do
      ids << li.product_id
    end
    for product in Product.all
      unless ids.include?(product.id)
        @order.line_items.build(:product_id => product.id, :product_name => Product.find(product.id).name)
      end
    end
  end
  
  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(order_path(@order), :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def send_order
    if params[:id]
      @order = Order.find(params[:id])
      OrderMailer.order_email(@order).deliver
      redirect_to(new_order_path, :notice => "Order was sent successfully.")
    else
      redirect_to(new_order_path, :error => "We're sorry, something went wrong.")
    end
  end
  
end
