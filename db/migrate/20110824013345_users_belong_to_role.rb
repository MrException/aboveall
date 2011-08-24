class UsersBelongToRole < ActiveRecord::Migration
  def up
    add_column :users, :role_id, :integer

    add_index :users, :role_id
  end

  def down
    remove_column :users, :role_id

    remove_index :users, :role_id
  end
end
