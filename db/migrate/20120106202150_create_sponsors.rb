class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.string :logo
      t.text :description
      t.string :website
      t.string :email
      t.integer :priority, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
