require 'spec_helper'

describe Order do

  it "should require a branch" do
    @order = Factory.build(:liskeard, :branch => "")
    @order.should_not be_valid
  end

  describe "Relationships" do

    it "should respond to an products method" do
      @order = Factory(:liskeard)
      @order.should respond_to(:products)
    end    
    
  end

end
