module BlacklightOembed
  module RouteSets
    protected
    def catalog
      add_routes do |options|
        match 'catalog/oembed', :to => "catalog#oembed", :as => 'oembed'
      end

      super
    end
  end
end
