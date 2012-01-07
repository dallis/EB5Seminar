class CreateSpeakers < ActiveRecord::Migration
  def self.up
    create_table :speakers do |t|
      t.string :name
      t.string :position
      t.text :about
      t.string :photo
      t.integer :priority, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :speakers
  end
end
