class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :identifier
      t.string :page_title
      t.string :content
      t.string :seo_title
      t.text :seo_description
      t.string :seo_keywords

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
