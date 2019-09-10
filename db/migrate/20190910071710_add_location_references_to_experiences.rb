class AddLocationReferencesToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_reference :experiences, :location, null: false, foreign_key: true
  end
end
