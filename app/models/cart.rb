class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :product_line_items

  def empty
    product_line_items.delete_all
  end
end
