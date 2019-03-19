class User < ApplicationRecord
 mount_uploader :picture, PictureUploader
 self.inheritance_column = :_type_disabled

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
        picture: auth.extra.raw_info.profile_background_image_url
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
