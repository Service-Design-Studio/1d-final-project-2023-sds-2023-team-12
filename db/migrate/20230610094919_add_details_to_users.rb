class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :mobile_phone, :string
  end
end
