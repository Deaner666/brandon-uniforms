require 'spec_helper'

describe LineItem do
  
  it "should require a product_id" do
    @li = Factory.build(:line_item, :product_id => "")
    @li.should_not be_valid
  end
  
  it "should require an order_id" do
    @li = Factory.build(:line_item, :order_id => "")
    @li.should_not be_valid
  end
  
  it "should require a quantity" do
    @li = Factory.build(:line_item, :quantity => "")
    @li.should_not be_valid
  end
  
  it "should require quantity to be a positive integer" do
    @li = Factory.build(:line_item, :quantity => "")
    @li.should_not be_valid
    @li = Factory.build(:line_item, :quantity => "1.50")
    @li.should_not be_valid
    @li = Factory.build(:line_item, :quantity => "-100")
    @li.should_not be_valid
    @li = Factory.build(:line_item, :quantity => "350")
    @li.should be_valid
  end
  
  describe "Relationships" do

    it "should respond to a product method" do
      @li = Factory(:line_item)
      @li.should respond_to(:product)
    end
    
    it "should respond to an order method" do
      @li = Factory(:line_item)
      @li.should respond_to(:order)
    end
    
  end
  
end
