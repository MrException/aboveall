class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :payment_method
      t.belongs_to :user

      t.timestamps
    end
  end
end
