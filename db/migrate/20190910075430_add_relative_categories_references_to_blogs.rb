class AddRelativeCategoriesReferencesToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :relative_categories, null: false, foreign_key: true
  end
end
