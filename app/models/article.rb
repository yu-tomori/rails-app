class Article < ApplicationRecord
 mount_uploader :image, ImageUploader
 belongs_to :user
 has_many :likes, dependent: :destroy
 has_many :like_users, through: :likes, source: :user
 validates :name, presence: true, length: { maximum: 30, too_long: "作品名は30文字以内でお願いします" }
 validates :url, presence: true, length: { maximum: 255, too_long: "申し訳ありませんが、256文字以上のURLは登録できません" }
 validates :description, presence: true, length: { maximum: 255, too_long: "申し訳ありませんが、256文字以上の説明は登録できません" }
 validates :catchcopy, presence: true, length: { maximum: 30, too_long: "申し訳ありませんが、31文字以上のキャッチコピーは登録できません" }

 def like(user)
  self.likes.create(user_id: user.id)
 end
 
 def unlike(user)
  self.likes.find_by(user_id: user.id).destroy
 end

 def like?(user)
   like_users.include?(user)
 end

end
