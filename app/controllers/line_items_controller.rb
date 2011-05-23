class LineItemsController < ApplicationController
  
  before_filter :find_order, :only => :create
  
  # POST /line_items  
  # POST /line_items.xml
  def create
    if @order.has_line_item?(params[:product_id].to_i, params[:size])
      
      # line_item already exists, so just bump the quantity
      @li = LineItem.where(:order_id => @order.id, :product_id => params[:product_id].to_i, :size => params[:size]).first
      @li.quantity += params[:quantity].to_i
      respond_to do |format|
        if @li.save
          format.html do
            redirect_to(
              root_path,
              :notice => @li.product.name + ' successfully added to order. <a href="' + edit_order_path(@li.order) + '">Edit order</a>'
            )
          end
          format.xml  { head :ok }
        else
          format.html { redirect_to(root_path, :alert => "There was a problem adding " + @li.product.name + " to your order.") }
          format.xml  { render :xml => @li.errors, :status => :unprocessable_entity }
        end
      end
      
    else

      # line_item doesn't exist yet, so create it
      @li = LineItem.new
      @li.product_id = params[:product_id]
      @li.order_id = params[:order_id]
      @li.quantity = params[:quantity]
      params[:size] != nil && params[:size] != "" ? @li.size = params[:size] : @li.size = nil
    
      respond_to do |format|
        if @li.save
          format.html do
            redirect_to(
              root_path,
              :notice => @li.product.name + ' successfully added to order. <a href="' + edit_order_path(@li.order) + '">Edit order</a>'
            )
          end
          format.xml  { render :xml => @li, :status => :created, :location => @li }
        else
          format.html { redirect_to(root_path, :alert => "There was a problem adding " + @li.product.name + " to your order.") }
          format.xml  { render :xml => @li.errors, :status => :unprocessable_entity }
        end
      end
      
    end
  end
  
  # PUT /line_items/1
  # PUT /line_items/1.xml
  def update
    @li = LineItem.find(params[:id])
    @li.product_id = params[:product_id]
    @li.order_id = params[:order_id]
    if request.referer.include? "edit"
      @li.quantity = params[:quantity].to_i
    else
      @li.quantity += params[:quantity].to_i
    end
    respond_to do |format|
      if @li.save
        format.html do
          redirect_to(
            edit_order_path(@li.order),
            :notice => @li.product.name + ' successfully updated. <a href="' + edit_order_path(@li.order) + '">Edit order</a>'
          )
        end
        format.xml  { head :ok }
      else
        format.html { redirect_to(root_path, :alert => "There was a problem adding " + @li.product.name + " to your order.") }
        format.xml  { render :xml => @li.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
