class ProductLineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates :quantity, :numericality => { :only_integer => true,
                                          :greater_than_or_equal_to => 0 }

  after_initialize :init

  def init
    self.quantity ||= 1
  end

  def self.from_product(product)
    ProductLineItem.new({ product: product })
  end

  def total
    quantity * product.price
  end
end
