##wip - not currently in use
# enabling full text search on psql
class EnablePgTrgmExtension < ActiveRecord::Migration[7.0]
  def up
    enable_extension 'pg_trgm'
  end

  def down
    disable_extension 'pg_trgm'
  end
end