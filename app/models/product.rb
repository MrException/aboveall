class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :unit
  validates_numericality_of :price, :greater_than => 0
end
