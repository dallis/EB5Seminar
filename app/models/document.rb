class Document < ActiveRecord::Base
	has_many :attachments
	attr_accessible :title, :description, :attachments_attributes
	accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank
end
