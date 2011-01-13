module BlacklightOembed::Solr::Document::OembedRich
  def self.extended(document)
    BlacklightOembed::Solr::Document::OembedRich.register_export_formats( document )
  end

  def self.register_export_formats(document)
  end

  def to_oembed
    {
      :version => '1.0',
      :type => oembed_type,
      :provider_name => '',
      :provider_url => '',
      :title => semantic_values[:title],
      :author_name => semantic_values[:author],
      :html => ''
    }
  end

  def oembed_type
    'rich'
  end
end
