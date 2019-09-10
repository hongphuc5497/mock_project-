class CreateRelativeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :relative_categories do |t|
      
      t.timestamps
    end
  end
end