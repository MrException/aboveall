require 'spec_helper'

describe "products/edit.html.haml" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :title => "MyString",
      :description => "MyString",
      :picture => "",
      :price => "9.99",
      :unit => "MyString",
      :hidden => false
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_title", :name => "product[title]"
      assert_select "input#product_description", :name => "product[description]"
      assert_select "input#product_picture", :name => "product[picture]"
      assert_select "input#product_price", :name => "product[price]"
      assert_select "input#product_unit", :name => "product[unit]"
      assert_select "input#product_hidden", :name => "product[hidden]"
    end
  end
end
