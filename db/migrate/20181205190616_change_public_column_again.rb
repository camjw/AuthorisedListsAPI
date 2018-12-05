class ChangePublicColumnAgain < ActiveRecord::Migration[5.2]
  def change
    rename_column :wish_lists, :publicItem, :public_list?
  end
end
