class LineItemsController < ApplicationController
  
  # before_filter :find_order
  
  # POST /line_items  
  # POST /line_items.xml
  def create
    @li = LineItem.new
    @li.product_id = params[:product_id]
    @li.order_id = params[:order_id]
    @li.quantity = params[:quantity]

    respond_to do |format|
      if @li.save
        format.html { redirect_to(root_path, :notice => @li.product.name + ' was successfully added.') }
        format.xml  { render :xml => @li, :status => :created, :location => @li }
      else
        format.html { redirect_to(root_path, :alert => "There was a problem adding " + @li.product.name + " to your order.") }
        format.xml  { render :xml => @li.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /line_items/1
  # PUT /line_items/1.xml
  def update
    @li = LineItem.find(params[:id])
    @li.product_id = params[:product_id]
    @li.order_id = params[:order_id]
    @li.quantity = params[:quantity]
    respond_to do |format|
      if @li.save
        format.html { redirect_to(root_path, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(root_path, :alert => 'Sorry, there was a problem updating your order.') }
        format.xml  { render :xml => @li.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end