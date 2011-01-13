module BlacklightOembed::Solr::Document::Oembed
  def self.extended(document)
    BlacklightOembed::Solr::Document::Oembed.register_export_formats( document )
  end

  def self.register_export_formats(document)
  end

  def to_oembed(oembed)
    semantic_values = self.to_semantic_values
    ({
      :version => '1.0',
      :type =>' link',
      :title => semantic_values[:title],
      :author_name => semantic_values[:author],
    }).merge(oembed)
  end
end
