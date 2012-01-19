class CitiesSponsors < ActiveRecord::Migration
  def self.up
    create_table :cities_sponsors, :id => false do |t|
      t.integer :city_id
      t.integer :sponsor_id      
    end
  end

  def self.down
    drop_table :cities_sponsors
  end
end
