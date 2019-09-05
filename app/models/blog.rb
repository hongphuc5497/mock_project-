class Blog < ApplicationRecord
  is_impressionable :counter_cache => :impressions_count
  has_many :impressions, as: :impressionable

  belongs_to :location

  has_one  :blog_detail 

  has_many :hashtags
  has_many :tags,       through: :hashtags

  has_many :relative_categories 
  has_many :categories, through: :relative_categories
end
