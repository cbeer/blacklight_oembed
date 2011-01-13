require 'blacklight_oembed'

# We do our injection in after_initialize so an app can stop it or configure
# it in an initializer, using BlacklightOembed.omit_inject .
config.after_initialize do 
  BlacklightOembed.inject!
end
