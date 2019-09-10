class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|

      t.timestamps
    end

    create_table :experience_details do |t|
      t.belongs_to :experience, index: true, foreign_key: true
      t.decimal :price_adult
      t.decimal :price_children
      t.decimal :price_infant
      t.string :duration
      t.string :age
      t.string :language
      t.string :title
      t.text   :description
      t.text   :content 
    end
  end
end
