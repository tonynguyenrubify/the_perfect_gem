require 'rails/generators'

module ThePerfectGem
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      def copy_js
        copy_file '../../../app/assets/javascripts/jquery.tokeninput.js', "app/assets/javascripts/jquery.tokeninput.js"
      end
      
      def inject_javascript
        append_to_file "app/assets/javascripts/application.js" do
          out = "\n"
          out << "//= require jquery.tokeninput"
          out << %Q{
jQuery	->
	$('#book_author_tokens').tokenInput	'/authors.json'
		theme:	'facebook'
		prePopulate:	$('#book_author_tokens').data('load')
}
        end
      end
    end
  end
end