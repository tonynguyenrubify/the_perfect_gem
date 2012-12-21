module ThePerfectGem::Helper
  def token_input_field(model_instance, relationship_name_pluralize, form)
    relationship_name = relationship_name_pluralize.singularize
    [
      form.label :"#{relationship_name}_tokens", relationship_name.capitalize %><br />
		  form.text_field :"#{relationship_name}_tokens", data: {load: model_instance.send(relationship_name)},
		  token_input(model_instance.class.to_s.tableize.singularize.to_sym, relationship_name)
	  ].join.html_safe
	end
	
	def token_input(model_name, relationship_name)
    javascript_tag(%Q{
      $(document).ready(function() {
        $('##{model_name}_#{relationship_name}_tokens').tokenInput('/#{relationship_name.pluralize}.json', {
          theme:	'facebook',
          prePopulate: $('##{model_name}_#{relationship_name}_tokens').data('load')
        });
      });
    })      
  end    
end
