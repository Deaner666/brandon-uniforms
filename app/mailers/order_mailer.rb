class OrderMailer < ActionMailer::Base
  
  default :from => "sales@drinkmaster.co.uk"
  
  def order_email(order)
    @order = order
    mail(:to => "stationery@brandonhire.co.uk",
         :bcc => "ddean@drinkmaster.co.uk, sales@drinkmaster.co.uk",
         :subject => "A Brandon Hire branch has placed a drinks order")
  end
  
end
