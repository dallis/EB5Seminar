class AddCostInfoToCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :price_short, :string
  end

  def self.down
    remove_column :cities, :price_short
  end
end
