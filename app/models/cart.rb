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
    product_line_items.reduce(0.0) do |sum, pli|
      sum + pli.total
    end
  end

  def total_weight
    product_line_items.reduce(0) do |sum, pli|
      sum + pli.quantity
    end
  end

  def add_product(id)
    begin
      product = Product.find(id)
      pli = pli_from_product product
      if pli
        pli.quantity = pli.quantity + 1
        pli.save
      else
        pli = ProductLineItem.new ({ product: product })
        product_line_items << ProductLineItem.from_product(product)
      end
    rescue ActiveRecord::RecordNotFound
      return false
    end
  end
end
