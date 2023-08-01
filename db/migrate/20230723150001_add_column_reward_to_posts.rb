class AddColumnRewardToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :reward, :integer, default:0
  end
end
