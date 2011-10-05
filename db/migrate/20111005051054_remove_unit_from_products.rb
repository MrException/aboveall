class RemoveUnitFromProducts < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.remove :unit
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
