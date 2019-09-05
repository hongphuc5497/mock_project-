class AddLocationReferenceToBlog < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :location 
  end
end
