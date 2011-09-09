class AddQuantityToProductLineItems < ActiveRecord::Migration
  def change
    add_column :product_line_items, :quantity, :integer
  end
end
