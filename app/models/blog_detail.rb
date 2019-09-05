class BlogDetail < ApplicationRecord
  is_impressionable 
  has_many :impressions, as: :impressionable 

  belongs_to :blog
end
