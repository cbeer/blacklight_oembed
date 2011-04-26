require 'blacklight_oembed'

# We do our injection in to_prepare so an app can stop it or configure
# it in an initializer, using BlacklightOembed.omit_inject .
config.to_prepare do 
  BlacklightOembed.inject!
end
