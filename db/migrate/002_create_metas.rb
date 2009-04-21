class CreateMetas < ActiveRecord::Migration
  def self.up
    create_table :metas do |t|
      t.integer "page_id"
      t.string "name"
      t.string "value"
      t.timestamps
    end
  end

  def self.down
    drop_table :metas
  end
end
