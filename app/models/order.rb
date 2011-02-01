# == Schema Information
# Schema version: 20110201220504
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  branch     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  contact    :string(255)
#

class Order < ActiveRecord::Base
  
  has_many :line_items
  has_many :products, :through => :line_items
  
  accepts_nested_attributes_for :line_items,
    :reject_if => lambda { |a| a[:quantity].blank? }
  
  validates :branch, :presence => true
  validates :contact, :presence => true
  
  # Find the total cost of an order by summing the cost of its line_items
  def total
    self.line_items.inject(0) {|x, li| x + li.total }
  end
  
end
