class Attachment < ActiveRecord::Base
  belongs_to :document
  has_attached_file :attachment
end
