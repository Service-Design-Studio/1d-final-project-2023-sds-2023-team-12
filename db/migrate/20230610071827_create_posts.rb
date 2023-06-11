class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :full_name
      t.integer :age
      t.string :location
      t.string :description
      t.string :special_note

      t.timestamps
    end
  end
end
