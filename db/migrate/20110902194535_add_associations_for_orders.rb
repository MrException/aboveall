class AddAssociationsForOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.belongs_to :user
    end

    change_table :product_line_items do |t|
      t.belongs_to :order
    end
  end
end
