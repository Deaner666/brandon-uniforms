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
  
  has_and_belongs_to_many :products
  
  validates :branch, :presence => true
  
end
