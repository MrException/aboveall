class AddLicenseScanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :license_file_name,    :string
    add_column :users, :license_content_type, :string
    add_column :users, :license_file_size,    :integer
    add_column :users, :license_updated_at,   :datetime
  end
end
