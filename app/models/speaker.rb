class Speaker < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "100x137>" }
end
