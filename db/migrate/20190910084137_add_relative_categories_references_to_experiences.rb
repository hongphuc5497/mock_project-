class AddRelativeCategoriesReferencesToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_reference :experiences, :relative_categories, null: false, foreign_key: true
  end
end
