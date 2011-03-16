class OrderMailer < ActionMailer::Base
  
  def order_email(order)
    @order = order
    mail(:from => "ddean@drinkmaster.co.uk",
         :to => "stationery@brandonhire.co.uk",
         :bcc => "lambcam@drinkmaster.co.uk, sales@drinkmaster.co.uk",
         :subject => "A drinks order has been placed by a Brandon Hire branch")
  end
  
end
