class AddDefaultToLikesTotal < ActiveRecord::Migration[7.2]
  def change
    change_column_default :likes, :total, from: nil, to: 0
  end
end
