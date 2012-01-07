module FormHelper
  def setup_document(document)
    5.times { document.attachments.build }
    document
  end
end
