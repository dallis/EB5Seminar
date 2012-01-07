class CreatePageBlocks < ActiveRecord::Migration
  def self.up
    create_table :page_blocks do |t|
      t.string :identifier
      t.text :content

      t.timestamps
    end
    add_index :page_blocks, :identifier rescue nil
    add_index :pages, :identifier rescue nil
  end

  def self.down
    drop_table :page_blocks
  end
end
