class Order < ActiveRecord::Base
  has_many :product_line_items
  belongs_to :user

  def self.from_cart(cart)
    order = self.new
    cart.product_line_items.each do |pli|
      order.product_line_items << pli
    end
    return order
  end
end
