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
      p = Page.new
      p.identifier = page
      p.page_title = page
      p.content = page
      p.seo_title = page
      p.seo_keywords = page
      p.seo_description = page
      p.save
    end
  end

  def self.down
    drop_table :pages
  end
end
