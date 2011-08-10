require 'spec_helper'

describe "products/show.html.haml" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :title => "Title",
      :description => "Description",
      :picture => "",
      :price => "9.99",
      :unit => "Unit",
      :hidden => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
