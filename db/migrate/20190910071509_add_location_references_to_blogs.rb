class AddLocationReferencesToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :location, null: false, foreign_key: true
  end
end
