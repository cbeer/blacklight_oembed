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
      :html => to_oembed_html
    }).merge(oembed)
  end

  def oembed_type
    'rich'
  end

  def to_oembed_html
    foo = ActionView::Base.new
    foo.view_paths = ApplicationController.view_paths
    foo.extend ApplicationHelper
    # foo.send :format, 'html'
    foo.render_document_partial(self, 'oembed')
  end
end
