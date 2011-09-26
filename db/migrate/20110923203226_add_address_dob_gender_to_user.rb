class AddAddressDobGenderToUser < ActiveRecord::Migration
  def change
    add_column :users, :road, :string
    add_column :users, :apt_number, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :postal_code, :string

    add_column :users, :gender, :string
    add_column :users, :dob, :date
  end
end
