class SpeakersPracticeAreas < ActiveRecord::Migration
  def self.up
    create_table :speakers_practice_areas, :id => false do |t|
      t.integer :speaker_id
      t.integer :practice_area_id
    end
  end

  def self.down
    drop_table :speakers_practice_areas
  end
end
