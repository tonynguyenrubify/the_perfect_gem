require 'rails/generators'

module ThePerfectGem
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      
      def copy_js
        copy_file '../../../app/assets/javascripts/jquery.tokeninput.js', "app/assets/javascripts/jquery.tokeninput.js"
      end
      
      def copy_css
        copy_file '../../../app/assets/stylesheets/token-input-facebook.css', "app/assets/stylesheets/token-input-facebook.css"
        copy_file '../../../app/assets/stylesheets/token-input-mac.css', "app/assets/stylesheets/token-input-mac.css"
        copy_file '../../../app/assets/stylesheets/token-input.css', "app/assets/stylesheets/token-input.css"
      end
      
      def inject_javascript
        append_to_file "app/assets/javascripts/application.js" do
          out = "\n"
          out << "//= require jquery.tokeninput"
        end
      end
      
      def inject_css
        append_to_file "app/assets/stylesheets/application.css" do
          out = "\n"
          out << "/*= require token-input-facebook"
        end  
      end  
    end
  end
end