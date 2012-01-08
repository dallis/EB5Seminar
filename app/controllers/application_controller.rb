class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery

  private
    def load_page
      @page = Page[action_name]
    end  
end
