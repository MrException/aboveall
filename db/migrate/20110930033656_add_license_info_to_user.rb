class AddLicenseInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :license_number, :string
    add_column :users, :possession_limit, :integer
    add_column :users, :license_expiry, :date
  end
end
