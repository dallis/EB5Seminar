class AddLogoColumnsToSponsor < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :logo_file_name, :string
    add_column :sponsors, :logo_content_type, :string
    add_column :sponsors, :logo_file_size, :integer
  end

  def self.down
    remove_column :sponsors, :logo_file_name, :string
    remove_column :sponsors, :logo_content_type, :string
    remove_column :sponsors, :logo_file_size, :integer
  end
end
