class HomeController < ApplicationController
  before_filter :load_page, :except => :sitemap
  before_filter :load_city_if_needed, :only => [:agenda, :costs, :speakers, :sponsors]

  def index
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

  def about
  end

  def costs
  end

  def sitemap
    headers["Content-Type"] = "text/xml"
    headers["Last-Modified"] = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

  private

    def load_city_if_needed
      begin
        @city = City.find params[:city_id]
      rescue
      end      
    end

end