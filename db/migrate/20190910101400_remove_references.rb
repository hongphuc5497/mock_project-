class RemoveReferences < ActiveRecord::Migration[6.0]
  def change
    remove_reference :blogs, :hashtags, null: false, foreign_key: true
    add_reference :hashtags, :blog, null: false, foreign_key: true

    remove_reference :blogs, :relative_categories, null: false, foreign_key: true
    add_reference :relative_categories, :blog, null: false, foreign_key: true

    remove_reference :experiences, :relative_categories, null: false, foreign_key: true
    add_reference :relative_categories, :experience, null: false, foreign_key: true
  end
end
