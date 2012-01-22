class Speaker < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "100x137>" }, :url => "/system/:class/:attachment/:id/:style/:filename"
  has_and_belongs_to_many :languages, :join_table => "speakers_languages", :uniq => true
  has_and_belongs_to_many :practice_areas, :join_table => "speakers_practice_areas", :uniq => true
  has_and_belongs_to_many :cities, :join_table => "cities_speakers", :uniq => true
  validates_presence_of :name
end
