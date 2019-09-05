class CreateHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags do |t|
      
      t.belongs_to :blog, index: true
      t.belongs_to :tag, index: true
    end
  end
end