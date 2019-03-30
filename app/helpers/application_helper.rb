module ApplicationHelper
 def default_meta_tags
   {
      site: 'My Portfolio',
      title: 'あなたの作品を投稿してみませんか？',
      reverse: true,
      charset: 'utf-8',
      description: 'My Portfolioは作品を投稿して楽しむサービスです',
      keywords: 'portfolio',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: asset_url('web-icon1.svg') },
        { href: asset_url('web-icon1.svg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/svg' }
      ],
      og: {
        site_name: :site, # もしくは site_name: :site
        title: :title, # もしくは title: :title
        description: :description, # もしくは description: :description
        type: 'website',
        url: request.original_url,
        image: image_url('mono-gradation6.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@peacetomori1118',
        url: request.original_url,
        image: asset_url('mono-gradation6.png'),
        title: :title,
        description: :desctiption
      }
    }
  end
end
