class CreateRelativeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :relative_categories do |t|
      
      t.belongs_to :blog,       index: true
      t.belongs_to :category,   index: true
    end
  end
end