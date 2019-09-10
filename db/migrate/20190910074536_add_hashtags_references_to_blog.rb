class AddHashtagsReferencesToBlog < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :hashtags, null: false, foreign_key: true
  end
end
