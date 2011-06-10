module BlacklightOembed::Solr::Document::OembedRich
  def self.extended(document)
    BlacklightOembed::Solr::Document::OembedRich.register_export_formats( document )
  end

  def self.register_export_formats(document)
  end

  def to_oembed(oembed)
    semantic_values = self.to_semantic_values
    ({
      :version => '1.0',
      :type => oembed_type,
      :provider_name => '',
      :provider_url => '',
      :title => semantic_values[:title],
      :author_name => semantic_values[:author],
      :html => (Proc.new do |controller| 
        controller.view_context.with_format(:html) { 
          controller.view_context.render_document_partial(self, 'oembed') 
        } 
      end)
    }).merge(oembed)
  end

  def oembed_type
    'rich'
  end
end
