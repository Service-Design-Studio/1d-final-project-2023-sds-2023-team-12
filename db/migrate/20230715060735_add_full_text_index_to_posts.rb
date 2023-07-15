#enabling full text search on sqlite3

class AddFullTextIndexToPosts < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'fts5'

    create_table :posts_fts, id: false do |t|
      t.integer :post_id
      t.text :content
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end

    execute <<-SQL
      INSERT INTO posts_fts(post_id, content)
      SELECT id, full_name || ' ' || description || ' ' || special_note
      FROM posts;
    SQL
  end

  def down
    disable_extension 'fts5'
    drop_table :posts_fts
  end
end