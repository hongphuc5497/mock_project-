class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|

      t.timestamps
    end

    create_table :blog_details do |t|
      t.belongs_to :blog, index: true
      t.string :title
      t.text :content
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end