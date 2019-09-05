class CreateBlogDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_details do |t|

      t.timestamps
    end
  end
end
