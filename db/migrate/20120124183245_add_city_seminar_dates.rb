class AddCitySeminarDates < ActiveRecord::Migration
  def self.up
    add_column :cities, :start_on, :date
    add_column :cities, :ends_on, :date
  end

  def self.down
    remove_column :cities, :start_on
    remove_column :cities, :ends_on
  end
end
