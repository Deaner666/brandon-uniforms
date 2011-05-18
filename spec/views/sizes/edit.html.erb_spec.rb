require 'spec_helper'

describe "sizes/edit.html.erb" do
  before(:each) do
    @size = assign(:size, stub_model(Size,
      :name => "MyString"
    ))
  end

  it "renders the edit size form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => size_path(@size), :method => "post" do
      assert_select "input#size_name", :name => "size[name]"
    end
  end
end
