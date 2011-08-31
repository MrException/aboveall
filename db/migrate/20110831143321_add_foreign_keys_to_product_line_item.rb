class AddForeignKeysToProductLineItem < ActiveRecord::Migration
  def change
    add_column :product_line_items, :cart_id, :integer
    add_column :product_line_items, :product_id, :integer
  end
end
