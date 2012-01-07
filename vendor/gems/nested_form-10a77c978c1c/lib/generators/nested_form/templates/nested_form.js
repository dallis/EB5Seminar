$(function() {
  
  //this function will remove the add buttons if
  //the limit of additional sections specified has been reached.
  //It will also rename the labels accordingly to what the user specified.
  //for example: Applicant to Co-Applicant  
  $.fn.update_labels_and_buttons = function(){
    var add_btn = null;
    
    for(var i=0;i<this.size();i++)
    {
      if($(this[i]).attr('class') == 'remove_nested_fields')
        this[i] = $(this[i]).closest('.fields').siblings('a.add_nested_fields')[0];
        
      var add_btn       = $(this[i]);
      var siblings      = $(this[i]).siblings('.fields');
      var children      = add_btn.parents('.fields').children('.fields').children('a.add_nested_fields');
                        
      var limit         = this[i].getAttribute('limit');
      var section_label = this[i].getAttribute('section');
      
      if($(children).size() > 0)
        $(children).update_labels_and_buttons();
        
      var remove_btn_array = $(siblings[0]).children('a.remove_nested_fields');
            
      $(remove_btn_array).hide();

      if(limit && siblings.size() >= limit)
        $(this[i]).hide();
      else
        $(this[i]).show();
        
      for(var j=1;j<siblings.size();j++)
      {
        //update section
        if(section_label)
        {
          var label = (j > 1 ? (section_label + " " + j) : section_label);
          $(siblings[j]).children('.section').html(label);
        }
        
        //remove duplicate fields if only the first occurence should be displayed
        $(siblings[j]).children('.input').each(function () {
          if($(this).attr('visible') == 'show_first_only')
            $(this).hide();
        });
      }
    }
  }

  $(document).ready(function() {$('form a.add_nested_fields').update_labels_and_buttons()});
  

  $('form a.add_nested_fields').live('click', function() {
    // Setup
    var assoc   = $(this).attr('data-association');           // Name of child
    var content = $('#' + assoc + '_fields_blueprint').html(); // Fields template

    // Make the context correct by replacing new_<parents> with the generated ID
    // of each of the parent objects
    var context = ($(this).closest('.fields').find('input:first').attr('name') || '').replace(new RegExp('\[[a-z]+\]$'), '');
    
    // context will be something like this for a brand new form:
    // project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
    // or for an edit form:
    // project[tasks_attributes][0][assignments_attributes][1]
    if(context) {
      var parent_names = context.match(/[a-z_]+_attributes/g) || [];
      var parent_ids   = context.match(/[0-9]+/g);

      for(i = 0; i < parent_names.length; i++) {
        if(parent_ids[i]) {
          content = content.replace(
            new RegExp('(\\[' + parent_names[i] + '\\])\\[.+?\\]', 'g'),
            '$1[' + parent_ids[i] + ']'
          )
        }
      }
    }

    // Make a unique ID for the new child
    var regexp  = new RegExp('new_' + assoc, 'g');
    var new_id  = new Date().getTime();
    content     = content.replace(regexp, new_id);

    var divToAdd = $(this).before(content);

    $(divToAdd).prev().hide();
    $(divToAdd).prev().fadeIn(300, function(){
      $(divToAdd).prev().show();
      $(this).update_labels_and_buttons()
    });
      $(this).update_labels_and_buttons()
    
    return false;
  });

  $('form a.remove_nested_fields').live('click', function() {
    var hidden_field = $(this).prev('input[type=hidden]')[0];   
    
    if(hidden_field) {
      hidden_field.value = '1';
    }
    
    var divToRemove = $(this).closest('.fields')
    divToRemove.fadeOut(300, function(){
      divToRemove.remove();
      $('a.add_nested_fields').update_labels_and_buttons();
    });

    return false;
  });
});