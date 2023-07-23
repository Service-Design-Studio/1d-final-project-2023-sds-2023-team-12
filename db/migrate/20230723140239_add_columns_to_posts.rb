class AddColumnsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :store_description, :string
    add_column :posts, :store_special_note, :string
  end
end
