class Page < ActiveRecord::Base
  MAPPINGS = {
    'index' => "Home",
    'agenda' => "Agenda",
    'speakers' => "Speakers",
    'venue' => 'Venue',
    'sponsors' => 'Sponsors',
    'resources' => 'Resources',
    'contact' => 'Contact Us'
  }

  validates_presence_of :identifier
  validates_presence_of :page_title
  validates_presence_of :seo_title
  validates_presence_of :seo_description
  validates_presence_of :seo_keywords

  def self.[](action_name)
    identifier = MAPPINGS[action_name]
    Page.where(:identifier => identifier).first || Page.create_page(identifier)
  end

  def self.create_page(identifier)
    p = Page.new
    p.identifier = identifier
    p.page_title = identifier
    p.content = identifier
    p.seo_title = identifier
    p.seo_keywords = identifier
    p.seo_description = identifier
    p.save
    p
  end

end
