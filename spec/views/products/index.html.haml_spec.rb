require 'spec_helper'

describe "products/index.html.haml" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :title => "Title",
        :description => "Description",
        :picture => "",
        :price => "9.99",
        :unit => "Unit",
        :hidden => false
      ),
      stub_model(Product,
        :title => "Title",
        :description => "Description",
        :picture => "",
        :price => "9.99",
        :unit => "Unit",
        :hidden => false
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
