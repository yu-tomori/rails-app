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
    picture: open("#{Rails.root}/app/assets/images/mono-gradation.png")
)

User.create!(
    name: "齋藤飛鳥",
    email: "asuka@gmail.com",
    nickname: "asuka",
    seedicon: open("#{Rails.root}/db/fixtures/saito-asuka.png"),
    password: "28167295",
    description: "アイドルやってます。乃木坂の次期エース候補です。",
    type: "乃木坂46一期生",
    picture: open("#{Rails.root}/app/assets/images/mono-gradation.png")
)

User.create!(
    name: "椎名林檎",
    email: "ringo@gmail.com",
    nickname: "ringo",
    seedicon: open("#{Rails.root}/db/fixtures/shina-ringo.png"),
    password: "28167295",
    description: "演出家です。作詞・作曲もします。昔は、東京事変というバンドをやっていました。",
    type: "演出家",
    picture: open("#{Rails.root}/app/assets/images/mono-gradation.png")
)

User.create!(
    name: "やくしまるえつこ",
    email: "etsuko@gmail.com",
    nickname: "ecchan",
    seedicon: open("#{Rails.root}/db/fixtures/yakushimaru-etsuko.png"),
    password: "28167295",
    description: "アーティストです。相対性理論というバンドをやっています。",
    type: "音楽家",
    picture: open("#{Rails.root}/app/assets/images/mono-gradation.png")
)

User.create!(
    name: "落合陽一",
    email: "ochiai@email.com",
    nickname: "ochiai",
    seedicon: open("#{Rails.root}/db/fixtures/ochiai-yoichi.png"),
    password: "28167295",
    description: "大学の先生です。デジタルネイチャーを提唱しています。",
    type: "大学の先生",
    picture: open("#{Rails.root}/app/assets/images/mono-gradation.png") 
)

10.times do
 Article.create!(
     user_id: "1",
     name: "伊藤万理華オフィシャルサイト",
     url: "https://itomarika.com/s/m03/?ima=5210",
     description: "私のオフィシャルサイトです。",
     catchcopy: "はじまりか、",
     image: open("#{Rails.root}/app/assets/images/mono-gradation.png")
 )
end

10.times do
 Article.create!(
     user_id: "2",
     name: "齋藤飛鳥の公式ブログ",
     url: "http://blog.nogizaka46.com/asuka.saito/",
     description: "私の公式ブログです。どうか見てやってください！",
     catchcopy: "乃木坂次期エースの独り言",
     image: open("#{Rails.root}/app/assets/images/mono-gradation.png")    
)
end

11.times do
 Article.create!(
     user_id: "3",
     name: "椎名林檎-SR 猫柳本線",
     url: "https://www.kronekodow.com/news/news_0.html",
     description: "2018年の10月と11月に開催された、椎名林檎のデビュー20周年記念のアリーナツアー「椎名林檎(生)林檎博'18 －不惑の余裕－」。こちらの模様がこのほど、Blu-rayとDVDで映像作品化されることとなりました。",
     catchcopy: "不惑の余裕",
     image: open("#{Rails.root}/app/assets/images/mono-gradation.png")
 )
end

12.times do 
 Article.create!(
     user_id: "4",
     name: "やくしまるえつこオフィシャルサイト",
     url: "http://yakushimaruetsuko.com/",
     description: "私のオフィシャルサイトです。最新情報などが確認できますので私のファンは是非ご利用ください。",
     catchcopy: "デザインすごいでしょ？",
     image: open("#{Rails.root}/app/assets/images/mono-gradation.png")     
 )
end

13.times do 
 Article.create!(
     user_id: "5",
     name: "落合陽一デジタルネイチャー研究室サイト",
     url: "https://digitalnature.slis.tsukuba.ac.jp/",
     description: "僕の研究室のサイトです。",
     catchcopy: "脱近代しようぜ！",
     image: open("#{Rails.root}/app/assets/images/mono-gradation.png")
 )
end

