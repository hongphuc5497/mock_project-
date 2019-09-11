class RelativeCategory < ApplicationRecord
  belongs_to :blog 
  belongs_to :category
  belongs_to :experience
end
