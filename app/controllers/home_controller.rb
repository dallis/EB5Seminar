class HomeController < ApplicationController
  before_filter :load_page, :except => :sitemap

  def index
  end

  def agenda
  end

  def speakers
    @speakers = Speaker.all
  end

  def venue
  end

  def sponsors
    @sponsors = Sponsor.all
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