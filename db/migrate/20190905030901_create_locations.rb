class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      
      t.string :province
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end