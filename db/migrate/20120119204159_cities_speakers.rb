class CitiesSpeakers < ActiveRecord::Migration
  def self.up
    create_table :cities_speakers, :id => false do |t|
      t.integer :city_id
      t.integer :speaker_id      
    end
  end

  def self.down
    drop_table :cities_speakers
  end
end
