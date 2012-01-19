class AddColumnToSpeakers < ActiveRecord::Migration
  def self.up
    add_column :speakers, :moderator, :boolean
  end

  def self.down
    remove_column :speakers, :moderator
  end
end
