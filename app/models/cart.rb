class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :product_line_items
  accepts_nested_attributes_for :product_line_items, :allow_destroy => true

  def empty
    product_line_items.delete_all
  end
end
