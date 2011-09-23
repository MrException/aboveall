class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :product_line_items
  accepts_nested_attributes_for :product_line_items, :allow_destroy => true

  def empty
    product_line_items.delete_all
  end

  def pli_from_product(product)
    product_line_items.each do |pli|
      if pli.product == product
        return pli
      end
    end
    nil
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
