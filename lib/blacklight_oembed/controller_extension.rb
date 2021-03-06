# Meant to be applied on top of a controller that implements
# Blacklight::SolrHelper. 
module BlacklightOembed::ControllerExtension
  def self.included(some_class)
    some_class.helper_method :oembed_config
    some_class.before_filter do
      extra_head_content << render_to_string(:partial => 'oembed/autodiscovery_link.html')
    end
  end

  def oembed
    url = Rails.application.routes.recognize_path(URI.parse(params[:url]).path,:method=>:get)
    @response, @document = get_solr_response_for_doc_id(url[:id])

    @oembed = @document.to_oembed({:provider_name => view_context.application_name, :provider_url => view_context.root_url})

    @oembed.select { |key,value| value.is_a? Proc }.each do |key, value|
      @oembed[key] = value.call(self)
    end

    respond_to do |format|
      format.html { render 'oembed/oembed', :layout => false }
      format.xml { render 'oembed/oembed' }
      format.json { render :json => @oembed.to_json }
    end

  end

  # Uses Blacklight.config, needs to be modified when
  # that changes to be controller-based. This is the only method
  # in this plugin that accesses Blacklight.config, single point
  # of contact. 
  def oembed_config   
    Blacklight.config[:oembed] || {}
  end

end
