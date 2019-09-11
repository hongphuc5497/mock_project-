class BlogDetail < ApplicationRecord
  is_impressionable 
  has_many :impressions, as: :impressionable 

  belongs_to :blog

  validates :title, :description, :content, presence: true
  validates :title, length: { maximum: 50 }
end
