class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image
  validates_numericality_of :price, :greater_than => 0

  # image attachment config
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :whiny => false
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /image.*/
  validates_attachment_size :image, :less_than => 2.megabyte

  has_many :product_line_items
end
