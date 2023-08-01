class AddColumnGenderToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :gender, :string
  end
end
