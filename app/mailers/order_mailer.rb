class OrderMailer < ActionMailer::Base
  
  default :from => "sales@drinkmaster.co.uk"
  
  def order_email(order)
    @order = order
    mail(:to => "lambcam@drinkmaster.co.uk, stationery@brandonhire.co.uk",
         :bcc => "sales@drinkmaster.co.uk",
         :subject => "A Brandon Hire branch has placed a drinks order")
  end
  
end
