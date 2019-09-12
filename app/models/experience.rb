require 'date'

class Experience < ApplicationRecord
  is_impressionable 
  has_many :impressions, as: :impressionable

  belongs_to :location 
  belongs_to :host

  has_one          :experience_detail 
  has_one_attached :image 

  has_many :relative_categories 
  has_many :categories, -> { distinct }, through: :relative_categories
  accepts_nested_attributes_for :relative_categories, allow_destroy: true 

  def available_dates_to_book
    @available_dates = Array.new 
    @dates = self.experience_detail
    @dates.each do |date| 
      (Date.parse(date.date_from.to_s)..Date.parse(date.date_to.to_s)).each do |available| 
        @available_dates.push available.strftime('%Y-%m-%d')
      end 
    end
    return @dates
  end
end
