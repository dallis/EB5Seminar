class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
    	t.string :attachment_file_name
    	t.string :attachment_content_type
    	t.string :attachment_file_size
    	t.references :document
      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
