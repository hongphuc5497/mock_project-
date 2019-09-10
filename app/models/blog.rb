class Blog < ApplicationRecord
  is_impressionable :counter_cache => :impressions_count
  has_many :impressions, as: :impressionable

  belongs_to :location
  belongs_to :host, optional: true 

  has_one          :blog_detail 
  has_one_attached :image

  has_many :hashtags 
  has_many :tags, -> { distinct }, through: :hashtags
  accepts_nested_attributes_for :hashtags, allow_destroy: true

  has_many :relative_categories 
  has_many :categories, -> { distinct }, through: :relative_categories
  accepts_nested_attributes_for :relative_categories, allow_destroy: true 

  validates :title, :description, :content, presence: true
  validates :title, uniqueness: true, length: { maximum: 50 }
end