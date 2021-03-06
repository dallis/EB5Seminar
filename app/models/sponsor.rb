class Sponsor < ActiveRecord::Base
	has_attached_file :logo, :styles => { :medium => "100x100>", :thumb => "50x50>" }
  has_and_belongs_to_many :cities, :join_table => "cities_sponsors", :uniq => true
  validates_presence_of :name
end
