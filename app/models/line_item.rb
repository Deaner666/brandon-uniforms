# == Schema Information
# Schema version: 20110201220504
#
# Table name: line_items
#
#  id           :integer         not null, primary key
#  order_id     :integer
#  product_id   :integer
#  quantity     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  product_name :string(255)
#

class LineItem < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product
  
  #validates :order_id,   :presence => true
  #validates :product_id, :presence => true
  validates :quantity,   :numericality => {
                         :only_integer => true,
                         :greater_than_or_equal_to => 0,
                         :allow_blank => true
                       }
  
  # Find the total cost of a line_item
  def total
    self.quantity != nil ? self.product.price * self.quantity : 0
  end
  
end
