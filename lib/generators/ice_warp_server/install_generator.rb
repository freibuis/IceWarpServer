module IceWarpServer
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      desc "This generator creates an initializer file for IceWarpServer Gem -> config/initializers/ice_warp_server.rb"

      def copy_initializer
        template 'initializer.rb', 'config/initializers/ice_warp_server.rb'
      end

      def self.banner
        "rails generate ice_warp_server:install"
      end


    end
  end
end