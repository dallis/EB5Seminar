class Speaker < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "100x137>" }
    has_and_belongs_to_many :languages, :join_table => "speakers_languages"
    has_and_belongs_to_many :practice_areas, :join_table => "speakers_practice_areas"
    has_and_belongs_to_many :cities
end
