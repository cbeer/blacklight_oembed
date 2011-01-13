
# We want to add a new collection action to Catalog, without over-writing
# what's already there. This SEEMS to do it. 
ActionController::Routing::Routes.draw do |map|  
  map.oembed 'catalog/oembed', :controller => 'catalog', :action => 'oembed'
end

