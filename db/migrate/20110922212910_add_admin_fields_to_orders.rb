class AddAdminFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :filled, :boolean
    add_column :orders, :payment_received, :boolean
    add_column :orders, :tracking, :string
  end
end
