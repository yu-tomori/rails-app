class Tag < ApplicationRecord
 has_many :tagmaps, dependent: :destroy
 has_many :articles, through: :tagmaps, source: :article

end
