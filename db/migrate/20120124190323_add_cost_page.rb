class AddCostPage < ActiveRecord::Migration
  def self.up
    Page.create_page("Costs")
  end

  def self.down
  end
end
