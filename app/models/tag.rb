class Tag < ApplicationRecord
  has_many :hashtags
  has_many :blogs, through: :hashtags
end
