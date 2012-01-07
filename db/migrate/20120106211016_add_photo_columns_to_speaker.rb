class AddPhotoColumnsToSpeaker < ActiveRecord::Migration
  def self.up
    add_column :speakers, :photo_file_name, :string
    add_column :speakers, :photo_content_type, :string
    add_column :speakers, :photo_file_size, :integer
  end

  def self.down
  	remove_column :speakers, :photo_file_name, :string
    remove_column :speakers, :photo_content_type, :string
    remove_column :speakers, :photo_file_size, :integer
  end
end
