class Category < ApplicationRecord
  has_many :relative_catogories
  has_many :blogs,       through: :relative_catogories
  has_many :experiences, through: :relative_catogories
end
