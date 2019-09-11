class RelativeCategory < ApplicationRecord
  belongs_to :category
  belongs_to :blog, optional: true
  belongs_to :experience, optional: true
end
