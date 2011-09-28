require 'blacklight'
require 'blacklight_oembed'
require 'rails'

module BlacklightOembed
  class Engine < Rails::Engine
    config.to_prepare do
      unless BlacklightOembed.omit_inject[:routes]
        Blacklight::Routes.send(:include, BlacklightOembed::RouteSets)
      end
    end
  end
end
