class OrderMailer < ActionMailer::Base
  
  default :from => "sales@drinkmaster.co.uk"
  
  def order_email(order)
    @order = order
    #TODO Make this the correct email address at Brandon
    mail(:to => "ddean@drinkmaster.co.uk",
         :subject => "A Brandon Hire branch has placed a drinks order")
    end  
  
end
