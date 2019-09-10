class AddTagReferencesToHashtags < ActiveRecord::Migration[6.0]
  def change
    add_reference :hashtags, :tag, null: false, foreign_key: true
  end
end
