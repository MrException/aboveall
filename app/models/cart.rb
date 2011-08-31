class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :product_line_items
end
