class Experience < ApplicationRecord
  is_impressionable 
  has_many :impressions, as: :impressionable

  belongs_to :location 

  has_one_attached :image 

  validates :title, :description, :content, :language, :age, :duration,
            :price_adult, :price_children, :price_infant, presence: true 
  validates :title, uniqueness: true, length: { maximum: 50 }
end
