class Order < ActiveRecord::Base
  has_many :product_line_items
  belongs_to :user

  def self.from_cart(cart)
    order = self.new
    cart.product_line_items.each do |pli|
      order.product_line_items << pli
    end
    order.user = cart.user
    order
  end

  def self.checkout(cart)
    order = from_cart(cart)
    if order.save!
      cart.empty
      OrderMailer.new_order(order).deliver
      order
    else
      false
    end
  end

  def empty?
    product_line_items.empty?
  end

  def total
    total = 0.00
    product_line_items.each do |pli|
      total = total + (pli.product.price * pli.quantity)
    end
    total
  end
end
