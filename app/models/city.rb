class City < ActiveRecord::Base
  has_attached_file :photo, :styles => {:small => "120x90>", :medium => "170x80>", :big => "980x345>"},
                            :url => "/system/:class/:attachment/:id/:style/:filename"

  has_and_belongs_to_many :speakers, :join_table => "cities_speakers", :uniq => true
  has_and_belongs_to_many :sponsors, :join_table => "cities_sponsors", :uniq => true

  validates_presence_of :name
  validates_presence_of :ends_on
  validates_presence_of :start_on
  validates_presence_of :price_short

  scope :upcoming, where('DATE(cities.ends_on) >= DATE(NOW())')
  scope :past, where('DATE(cities.ends_on) < DATE(NOW())')
  scope :by_date, order("start_on")

  def event_range
    if start_on == ends_on
      start_on.strftime('%B %d, %Y')
    else
      "#{start_on.strftime('%B %d')} - #{ends_on.strftime('%B %d, %Y')}"
    end
  end

  def to_param
    "#{id}-#{self.name}".downcase.gsub(/[^a-z0-9а-яА-Я]+/i, '-')
  end
end
