class SimpleForm::FormBuilder
  def link_to_add(name, association, html_options = {})
    association = association.to_sym
    html_options.merge!(:class => "add_nested_fields", "data-association" => association)
    @fields ||= {}
    @template.after_nested_form(association) do
      model_object = object.class.reflect_on_association(association).klass.new
      output = %Q[<div id="#{association}_fields_blueprint" style="display: none">].html_safe
      output << fields_for(association, model_object, :child_index => "new_#{association}", &@fields[association])
      output.safe_concat('</div>')
      output
    end
    @template.link_to(name, "javascript:void(0)", html_options)
  end
  
  def link_to_remove(name)
    hidden_field(:_destroy) + @template.link_to(name, "javascript:void(0)", :class => "remove_nested_fields")
  end
  
  
  def fields_for_with_nested_attributes(association, args, block)
    @fields ||= {}
    @fields[association] = block
    super
  end

  
  def fields_for_nested_model(name, association, args, block = nil)
    output = '<div class="fields">'.html_safe
    if block.nil?
      block = lambda do |f|
        contents = @template.render :partial => "#{association.class.name.downcase}_fields", :locals => {:f => f}
        template.concat(contents)
        contents        
      end
    end
    output << super
    output.safe_concat('</div>')
    output
  end
end