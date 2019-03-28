# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 初期ユーザーの設定
User.create!(
    name: "伊藤万理華",
    email: "marika@gmail.com",
    nickname: "marikka",
    seedicon: open("#{Rails.root}/db/fixtures/ito-marika.png"),
    password: "28167295",
    description: "女優です。",
    type: "元乃木坂46",
    picture: open("#{Rails.root}/app/assets/images/mono-gradation5.png")
)

User.create!(
    name: "齋藤飛鳥",
    email: "asuka@gmail.com",
    nickname: "asuka",
    seedicon: open("#{Rails.root}/db/fixtures/saito-asuka.png"),
    password: "28167295",
    description: "アイドルやってます。乃木坂の次期エース候補です。",
    type: "乃木坂46一期生",
    picture: open("#{Rails.root}/app/assets/images/mono-gradation5.png")
)

User.create!(
    name: "椎名林檎",
    email: "ringo@gmail.com",
    nickname: "ringo",
    seedicon: open("#{Rails.root}/db/fixtures/shina-ringo.png"),
    password: "28167295",
    description: "演出家です。作詞・作曲もします。昔は、東京事変というバンドをやっていました。",
    type: "演出家",
    picture: open("#{Rails.root}/app/assets/images/mono-gradation5.png")
)

User.create!(
    name: "やくしまるえつこ",
    email: "etsuko@gmail.com",
    nickname: "ecchan",
    seedicon: open("#{Rails.root}/db/fixtures/yakushimaru-etsuko.png"),
    password: "28167295",
    description: "アーティストです。相対性理論というバンドをやっています。",
    type: "音楽家",
    picture: open("#{Rails.root}/app/assets/images/mono-gradation5.png")
)

User.create!(
    name: "落合陽一",
    email: "ochiai@email.com",
    nickname: "ochiai",
    seedicon: open("#{Rails.root}/db/fixtures/ochiai-yoichi.png"),
    password: "28167295",
    description: "大学の先生です。デジタルネイチャーを提唱しています。",
    type: "大学の先生",
    picture: open("#{Rails.root}/app/assets/images/mono-gradation5.png") 
)

10.times do
 Article.create!(
     user_id: "1",
     name: "伊藤万理華オフィシャルサイト",
     url: "https://itomarika.com/s/m03/?ima=5210",
     description: "私のオフィシャルサイトです。",
     catchcopy: "はじまりか、",
     image: open("#{Rails.root}/app/assets/images/mono-gradation4.png"),
     type: "文章"
 )
end

10.times do
 Article.create!(
     user_id: "2",
     name: "齋藤飛鳥の公式ブログ",
     url: "http://blog.nogizaka46.com/asuka.saito/",
     description: "私の公式ブログです。どうか見てやってください！",
     catchcopy: "乃木坂次期エースの独り言",
     image: open("#{Rails.root}/app/assets/images/mono-gradation4.png"),
     type: "文章"    
)
end

11.times do
 Article.create!(
     user_id: "3",
     name: "椎名林檎-SR 猫柳本線",
     url: "https://www.kronekodow.com/news/news_0.html",
     description: "2018年の10月と11月に開催された、椎名林檎のデビュー20周年記念のアリーナツアー「椎名林檎(生)林檎博'18 －不惑の余裕－」。こちらの模様がこのほど、Blu-rayとDVDで映像作品化されることとなりました。",
     catchcopy: "不惑の余裕",
     image: open("#{Rails.root}/app/assets/images/mono-gradation4.png"),
     type: "音楽"
 )
end

12.times do 
 Article.create!(
     user_id: "4",
     name: "やくしまるえつこオフィシャルサイト",
     url: "http://yakushimaruetsuko.com/",
     description: "私のオフィシャルサイトです。最新情報などが確認できますので私のファンは是非ご利用ください。",
     catchcopy: "デザインすごいでしょ？",
     image: open("#{Rails.root}/app/assets/images/mono-gradation4.png"),
     type: "Webサイト" 
 )
end

13.times do 
 Article.create!(
     user_id: "5",
     name: "落合陽一デジタルネイチャー研究室サイト",
     url: "https://digitalnature.slis.tsukuba.ac.jp/",
     description: "僕の研究室のサイトです。",
     catchcopy: "脱近代しようぜ！",
     image: open("#{Rails.root}/app/assets/images/mono-gradation4.png"),
     type: "Webサイト"
 )
end

users = User.all
user = users.first
following = users[2..4]
followers = users[3..5]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

tags = ['Webアプリケーション', 'iPhoneアプリ', 'Androidアプリ', 'Webサイト', 'ロゴデザイン', 'ヘッダーでサイン', '動画', 'デッサン', '鉛筆書き', 'イラスト', 'グラフィックデザイン', 'プロダクトデザイン', 'サウンド', 'UI', 'UX', 'ゲーム', 'コピー', '記事', '漫画', 'ファッション', 'メイクアップ', 'スタイリング', 'ヘアカット', '作詞', '音楽', '演出', '料理', '彫刻', '小説', '随筆', '脚本', '劇', '詩', '曲', '俳句', '旅行記', 'ノンフィクション',  'Ruby', 'Java', 'Python', 'Go', 'Scala', 'HTML&CSS', 'JavaScript', 'C', 'C#', 'Unity', 'C++', 'Elixir', 'Kotlin', 'Objective-C', 'PHP', 'Swift', 'Perl', 'Rust', 'TypeScript', , 'Illustrator', 'Premiere Rush', 'Premiere Pro', 'After Effect', 'Lightroom', 'Dreamweaver', 'XD', 'Bridge', 'Portfolio', 'Spark', 'Behance', 'Color', 'InDesign', 'Dimension', 'Animate', 'Character Animator', 'Audition', 'InCopy', 'Prelude', 'Fuse', 'Camera Raw', 'PowerPoint', 'DTM', 'Studio One', 'Logic Pro', 'Cubase', 'Ableton Live', 'FL Studio', 'Pro Tools', 'Sketch', 'Figma', 'InVision Studio', 'STUDIO', '私のポートフォリオ', 'コメントください', '一応プロです', ]
tags.each do |tag|
 Tag.create!(
     content: tag
 )
end
