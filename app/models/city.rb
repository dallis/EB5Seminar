class City < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "300x200>" }
    has_and_belongs_to_many :speakers, :join_table => "cities_speakers"
    has_and_belongs_to_many :sponsors, :join_table => "cities_sponsors"
end
