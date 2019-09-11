class ChangeNameColumnAndFixReference < ActiveRecord::Migration[6.0]
  def change
    rename_column :tags,        :tag_name, :name
    rename_column :categories,  :category_name, :name 

    change_column :relative_categories, :blog_id,       :bigint, :null => true
    change_column :relative_categories, :experience_id, :bigint, :null => true 
  end
end
