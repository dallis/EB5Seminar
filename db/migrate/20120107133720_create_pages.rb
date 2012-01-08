class CreatePages < ActiveRecord::Migration
  def self.up
    drop_table :pages rescue nil

    create_table :pages do |t|
      t.string :identifier
      t.string :page_title
      t.text :content
      t.string :seo_title
      t.string :seo_description
      t.string :seo_keywords

      t.timestamps
    end

    ["Home", "Agenda", "Speakers", "Venue", "Sponsors", "Resources", "Contact Us"].each do |page|
      Page.create_page(page)
    end
  end

  def self.down
    drop_table :pages
  end
end
