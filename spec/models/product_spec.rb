require 'spec_helper'

describe Product do
  it { should have_many(:product_line_items) }
  describe "image attachment" do
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_content_type(:image).
         allowing('image/png', 'image/gif').
         rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:image).
         less_than(2.megabytes) }
  end

  it "should require fields" do
    should validate_presence_of :title
    should validate_presence_of :description
    should validate_presence_of :short_description
    should validate_presence_of :price
  end

  it "should validate proper price" do
    p = FactoryGirl.build(:product)
    p.price = -1
    p.should have(1).error_on(:price)
  end
end
