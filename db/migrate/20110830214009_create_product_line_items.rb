class CreateProductLineItems < ActiveRecord::Migration
  def change
    create_table :product_line_items do |t|

      t.timestamps
    end
  end
end
