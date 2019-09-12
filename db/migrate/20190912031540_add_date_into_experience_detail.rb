class AddDateIntoExperienceDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :experience_details, :date_from, :date  
    add_column :experience_details, :date_to,   :date 
    add_column :experience_details, :month,     :integer 
    add_column :experience_details, :year,      :integer

    add_column :experience_details, :created_at, :datetime
    add_column :experience_details, :updated_at, :datetime
  end
end
