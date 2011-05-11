class OrderMailer < ActionMailer::Base
  
  def order_email(order)
    @order = order
    mail(:from => "sales@monmark.co.uk",
         :to => "mail@dave-dean.co.uk",
         :bcc => "mail@dave-dean.co.uk",
         :subject => "An order for uniforms has been placed by a Brandon Hire branch")
  end
  
end
