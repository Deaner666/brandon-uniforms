class PagesController < ApplicationController
  
  before_filter :find_order
  
  def contact_us
    @title = "Contact us"
  end
  
end
