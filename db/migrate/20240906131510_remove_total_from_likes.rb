class RemoveTotalFromLikes < ActiveRecord::Migration[7.2]
  def change
    remove_column :likes, :total
  end
end
