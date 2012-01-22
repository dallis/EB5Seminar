class City < ActiveRecord::Base
  has_attached_file :photo, :styles => {:small => "120x90>", :medium => "170x80>", :big => "980x345>"},
                            :url => "/system/:class/:attachment/:id/:style/:filename"
  has_and_belongs_to_many :speakers, :join_table => "cities_speakers", :uniq => true
  has_and_belongs_to_many :sponsors, :join_table => "cities_sponsors", :uniq => true
  validates_presence_of :name
end
