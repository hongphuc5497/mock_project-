class Experience < ApplicationRecord
  is_impressionable 
  has_many :impressions, as: :impressionable

  belongs_to :location 
  belongs_to :host

  has_one_attached :image 

  has_many :relative_categories 
  has_many :categories, -> { distinct }, through: :relative_categories
  accepts_nested_attributes_for :relative_categories, allow_destroy: true 
end
