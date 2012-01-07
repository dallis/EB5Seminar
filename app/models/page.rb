class Page < ActiveRecord::Base
  validates_presence_of :identifier
  validates_presence_of :page_title
  validates_presence_of :seo_title
  validates_presence_of :seo_description
  validates_presence_of :seo_keywords
end
