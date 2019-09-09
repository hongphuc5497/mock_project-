class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|

      t.belongs_to :location, foreign_key: true
    end

    create_table :blog_details do |t|
      t.belongs_to :blog, index: true
      t.string :title
      t.text :description
      t.text :content
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end