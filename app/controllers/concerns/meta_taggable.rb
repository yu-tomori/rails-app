module MetaTaggable
  extend ActiveSupport::Concern
 
  include ActionView::Helpers::AssetUrlHelper
 
  included do
    before_action :prepare_meta_tags
  end
 
  private
 
  def prepare_meta_tags(options = {})
    base = t('meta_tags.base')
 
    site = base[:site]
    description = base[:description]
    title = t("meta_tags.titles.#{controller_name}.#{action_name}", default: '')
    image = image_url('logo3.png')
    image = options[:image].presence || image_url('logo3.png')
 
    defaults = {
      site: site,
      title: title,
      description: description,
      canonical: request.url,
      og: {
        url: request.url,
        title: title.presence || site,
        description: description,
        site_name: site,
        type: 'article',
        image: image
      },
      twitter: {
        card: 'summary',
        site: '@peacetomori1118',
        title: title.presence || site,
        description: description,
        image: image
      }
    }
 
    options.reverse_merge!(defaults)
 
    set_meta_tags(options)
  end
end

