require 'spec_helper'

describe Product do
  
  it "should require a name" do
    @product = Factory.build(:gold_blend_white, :name => "")
    @product.should_not be_valid
  end
  
  it "should require a stock_code" do
    @product = Factory.build(:gold_blend_white, :stock_code => "")
    @product.should_not be_valid
  end
  
  it "should require a price" do
    @product = Factory.build(:gold_blend_white, :price => "")
    @product.should_not be_valid
  end
  
  it "should require price to be a positive integer (inc. 0)" do
    @product = Factory.build(:gold_blend_white, :price => "")
    @product.should_not be_valid
    @product = Factory.build(:gold_blend_white, :price => "1.50")
    @product.should_not be_valid
    @product = Factory.build(:gold_blend_white, :price => "-100")
    @product.should_not be_valid
    @product = Factory.build(:gold_blend_white, :price => "350")
    @product.should be_valid
    @product = Factory.build(:gold_blend_white, :price => "0")
    @product.should be_valid
  end
  
  describe "Relationships" do

    it "should respond to an orders method" do
      @product = Factory(:gold_blend_white)
      @product.should respond_to(:orders)
    end    
    
  end
  
end
