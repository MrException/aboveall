require 'spec_helper'

describe "carts/index.html.haml" do
  before(:each) do
    assign(:carts, [
      stub_model(Cart),
      stub_model(Cart)
    ])
  end

  it "renders a list of carts" do
    render
  end
end
