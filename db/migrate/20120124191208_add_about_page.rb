class AddAboutPage < ActiveRecord::Migration
  def self.up
    Page.create_page("About")
  end

  def self.down
  end
end
