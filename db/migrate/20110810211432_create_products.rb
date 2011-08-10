class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.binary :picture
      t.decimal :price
      t.string :unit
      t.boolean :hidden

      t.timestamps
    end
  end
end
