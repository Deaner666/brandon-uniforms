# == Schema Information
# Schema version: 20110127132432
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  branch     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
  
  has_many :line_items
  has_many :products, :through => :line_items
  
  accepts_nested_attributes_for :line_items
  
  validates :branch, :presence => true
  
end
