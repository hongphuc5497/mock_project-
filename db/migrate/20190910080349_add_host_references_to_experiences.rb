class AddHostReferencesToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_reference :experiences, :host, null: false, foreign_key: true
  end
end
