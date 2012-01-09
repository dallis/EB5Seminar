class Document < ActiveRecord::Base
	has_many :attachments	
	accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank


	def has_title_of_attach?
		i = 1		
		if self.attachments.count == 1	    
	    	i = 0 if self.attachments.first.title == ""
	  end
	  return true if i == 1
	end

end