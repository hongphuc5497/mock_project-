class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|

    t.string :tag_name
    t.datetime "created_at"
    t.datetime "updated_at"      
    end
  end
end
