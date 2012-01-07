class RemoveLogoFromSponsor < ActiveRecord::Migration
  def self.up
    remove_column :sponsors, :logo
  end

  def self.down
    add_column :sponsors, :logo, :string
  end
end
