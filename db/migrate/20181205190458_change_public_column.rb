class ChangePublicColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :wish_lists, :public, :publicItem
  end
end
