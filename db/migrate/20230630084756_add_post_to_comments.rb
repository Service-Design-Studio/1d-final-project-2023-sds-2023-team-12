class AddPostToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post
  end
end
