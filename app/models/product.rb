# == Schema Information
# Schema version: 20110127120040
#
# Table name: products
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  stock_code :string(255)
#  price      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Product < ActiveRecord::Base
  
  has_and_belongs_to_many :orders
  
  validates :name,       :presence => true
  validates :stock_code, :presence => true
  validates :price,      :presence => true,
                         :numericality => {
                          :only_integer => true,
                          :greater_than => 0
                         }
end
