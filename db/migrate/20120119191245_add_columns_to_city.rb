class AddColumnsToCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :agenda, :text
    add_column :cities, :price, :text
  end

  def self.down
    remove_column :cities, :price
    remove_column :cities, :agenda
  end
end
