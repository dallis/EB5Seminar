class RemovePhotoFromSpeaker < ActiveRecord::Migration
  def self.up
    remove_column :speakers, :photo
  end

  def self.down
    add_column :speakers, :photo, :string
  end
end
