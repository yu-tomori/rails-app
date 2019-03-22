class User < ApplicationRecord
 mount_uploader :picture, PictureUploader
 mount_uploader :seedicon, IconUploader
 self.inheritance_column = :_type_disabled
 has_many :articles, dependent: :destroy
 has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
 has_many :following, through: :active_relationships, source: :followed
 has_many :followers, through: :passive_relationships, source: :follower
 has_many :likes, dependent: :destroy
 validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.find_for_oauth(auth)
    user = User.where( uid: auth.uid, provider: auth.provider ).first

    # .friendly_token => generate a friendly string randomly to be used as token. By default, length is 20 characters.
    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider, 
        email: User.dummy_email(auth), 
        password: Devise.friendly_token[0, 20],
        image: auth.info.image,
        name: auth.info.name, 
        nickname: auth.info.nickname,
        description: auth.info.description,
        picture: open("#{Rails.root}/app/assets/images/mono-gradation.png")
      )
    end

    user
  end
 
  def follow(other_user)
   following << other_user
  end
 
  def unfollow(other_user)
   active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
   following.include?(other_user)
  end

  def likes
   i = 0
   self.articles.each do |article|
    i += article.likes.count
   end
   return i
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
