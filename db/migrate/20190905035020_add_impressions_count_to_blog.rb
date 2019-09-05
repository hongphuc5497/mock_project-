class AddImpressionsCountToBlog < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :impressions_count, :int, :default => 0
  end
end
