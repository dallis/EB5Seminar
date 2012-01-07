module ApplicationHelper

	def title(t)
    content_for :title do
      t + " | EB5 Seminar"
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

end
