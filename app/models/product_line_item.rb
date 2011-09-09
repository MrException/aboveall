class ProductLineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates :quantity, :numericality => { :only_integer => true,
                                          :greater_than_or_equal_to => 0 }

  after_initialize :init

  def init
    self.quantity ||= 1
  end
end
