# == Schema Information
# Schema version: 20110520200807
#
# Table name: sizes
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Size < ActiveRecord::Base
  
  has_and_belongs_to_many :products
  
  validates_presence_of :name
  
end
