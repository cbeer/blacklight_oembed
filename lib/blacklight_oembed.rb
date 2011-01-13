# BlacklightOembed

module BlacklightOembed
  @omit_inject = {}
  def self.omit_inject=(value)
    value = Hash.new(true) if value == true
    @omit_inject = value      
  end
  def self.omit_inject ; @omit_inject ; end
  
  def self.inject!
    Dispatcher.to_prepare do

     unless omit_inject[:controller_mixin]
        CatalogController.send(:include, BlacklightOembed::ControllerOverride) unless CatalogController.include?(BlacklightOembed::ControllerOverride)
      end

     unless omit_inject[:autodiscovery_link]
       CatalogController.before_filter :only => :show do |controller|
         safe_arr_add(controller.extra_head_content, controller.send(:render_to_string, :partial => 'oembed/autodiscovery_link'))
       end
     end

    end
  end

  def self.safe_arr_add(array, element)
    array << element unless array.include?(element)
  end
end
