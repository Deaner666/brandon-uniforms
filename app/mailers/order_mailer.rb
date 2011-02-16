class OrderMailer < ActionMailer::Base
  
  def order_email(order)
    @order = order
    mail(:from => "sales@drinkmaster.co.uk",
         :to => "stationery@brandonhire.co.uk",
         :bcc => "ddean@drinkmaster.co.uk, sales@drinkmaster.co.uk",
         :subject => "A drinks order has been placed by a Brandon Hire branch")
  end
  
end
