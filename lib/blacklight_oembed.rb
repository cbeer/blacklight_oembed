# BlacklightOembed

module BlacklightOembed
  autoload :ControllerExtension, 'blacklight_oembed/controller_extension'
  autoload :Solr, 'blacklight_oembed/solr'
  autoload :RouteSets, 'blacklight_oembed/route_sets'

  require 'blacklight_oembed/version'
  require 'blacklight_oembed/engine'

  @omit_inject = {}

  def self.omit_inject=(value)
    value = Hash.new(true) if value == true
    @omit_inject = value      
  end

  def self.omit_inject ; @omit_inject ; end
  
end
