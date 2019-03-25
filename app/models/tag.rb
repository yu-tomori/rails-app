class Tag < ApplicationRecord
 has_many :articles, through: :tagmaps

end
