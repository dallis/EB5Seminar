module ApplicationHelper

  def w3c_date(date)
    date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

  def yield_or_default(message, default_message = "")
    message.nil? ? default_message : message
  end
  
  def title(t)
    content_for :title do
      t + " | " + TITLE
    end
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
