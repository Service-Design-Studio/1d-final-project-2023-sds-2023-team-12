class AddMissingTimeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :missing_time, :datetime
  end
end
