class HomeController < ApplicationController
  before_filter :load_page, :except => :sitemap

  def index
    @cities = City.all
    @cities_us = City.where(:in_us => true)
    @cities_in = City.where(:in_us => false)
  end

  def agenda
  end

  def speakers
    @speakers = Speaker.order("priority")
  end

  def venue
  end

  def sponsors
    @sponsors = Sponsor.order("priority")
  end

  def resources
    @documents = Document.all
  end

  def contact
  end

  def sitemap
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

end