# == Schema Information
# Schema version: 20110127152334
#
# Table name: line_items
#
#  id         :integer         not null, primary key
#  order_id   :integer
#  product_id :integer
#  quantity   :integer
#  created_at :datetime
#  updated_at :datetime
#

class LineItem < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product
  
  validates :order_id, :presence => true
  validates :product_id, :presence => true
  validates :quantity, :presence => true,
                       :numericality => {
                         :only_integer => true,
                         :greater_than => 0
                       }
  
end
