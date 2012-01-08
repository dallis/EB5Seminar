class Admin::DashboardController < InheritedResources::Base
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::NumberHelper

  before_filter :load_page
  
  respond_to :html, :xml, :json
  layout 'admin'

  USER, PASSWORD = 'admin', 'admin12345'
  before_filter :authenticate
  
  def welcome
  end
  
  private
    
    def authenticate
      authenticate_or_request_with_http_basic do |id, password|
        id == USER && password == PASSWORD
      end
    end

    def load_page
      @p = Page.new
      @p.identifier = action_name
      @p.page_title = controller_name + "/" + action_name
      @p.content = controller_name + "/" + action_name
      @p.seo_title = controller_name + "/" + action_name
      @p.seo_keywords = controller_name + "/" + action_name
      @p.seo_description = controller_name + "/" + action_name
      @p      
    end

end