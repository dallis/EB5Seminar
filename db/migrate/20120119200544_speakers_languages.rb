class SpeakersLanguages < ActiveRecord::Migration
  def self.up
    create_table :speakers_languages, :id => false do |t|
      t.integer :speaker_id
      t.integer :language_id
    end
  end

  def self.down
    drop_table :speakers_languages
  end
end
