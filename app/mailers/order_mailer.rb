class OrderMailer < ActionMailer::Base
  
  default :from => "sales@drinkmaster.co.uk"
  
  def order_email(order)
    @order = order
    mail(:to => "bernard.french@brandonhire.co.uk, stationery@brandonhire.co.uk, tim.lethaby@brandonhire.co.uk",
         :bcc => "ddean@drinkmaster.co.uk, sales@drinkmaster.co.uk",
         :subject => "A Brandon Hire branch has placed a drinks order")
  end
  
end
