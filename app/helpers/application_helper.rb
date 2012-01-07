module ApplicationHelper


  def add_editor
    content_for :css do
      stylesheet_link_tag '/redactor/css/editor.css'
    end
    content_for :js do
      javascript_include_tag '/redactor/editor.js'
    end
  end
  
  def editor(element) 
    content_for :on_ready do 
      "$('#{element}').editor(redactor);".html_safe
    end
  end 

  def w3c_date(date)
    date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

  def yield_or_default(message, default_message = "")
    message.nil? ? default_message : message
  end
  
  def flash_messages
    messages = []
    %w(notice warning error).each do |msg|
      messages << "<div class='#{msg} flash'>#{html_escape(flash[msg.to_sym])}</div>" unless flash[msg.to_sym].blank?
    end
    flash.clear
    messages
  end

  def inside_layout(layout = 'application', &block) 
    render :inline => capture_haml(&block), :layout => "layouts/#{layout}" 
  end

  def description(t)
    content_for :description do
      t + " | " + DESCRIPTION
    end
  end  

  def keywords(t)
    content_for :keywords do
      t + " | " + KEYWORDS
    end
  end     

  def title(t)
    content_for :title do
      t + " | EB5 Seminar"
    end
  end

  def include_google_analytics
    render :partial => '/shared/ga' if Rails.env == 'production'
  end

  def pc(identifier)
    (PageBlock.find_or_create_by_identifier(identifier).content || '').html_safe
  end

end