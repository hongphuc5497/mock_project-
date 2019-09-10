class RelativeCategory < ApplicationRecord
  belongs_to :blog 
  belongs_to :category,   optional: true
  belongs_to :experience, optional: true 
end
