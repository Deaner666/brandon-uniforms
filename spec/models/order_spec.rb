require 'spec_helper'

describe Order do

  it "should require a branch" do
    @order = Factory.build(:order, :branch => "")
    @order.should_not be_valid
  end

  describe "Relationships" do

    it "should respond to a products method" do
      @order = Factory(:order)
      @order.should respond_to(:products)
    end
    
    it "should respond to a line_items method" do
      @order = Factory(:order)
      @order.should respond_to(:line_items)
    end
    
  end

end
