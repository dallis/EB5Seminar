class Sponsor < ActiveRecord::Base
	has_attached_file :logo, :styles => { :medium => "100x100>", :thumb => "50x50>" }
end
