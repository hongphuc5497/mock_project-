class AddCategoryReferencesToRelativeCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference :relative_categories, :category, null: false, foreign_key: true
  end
end
