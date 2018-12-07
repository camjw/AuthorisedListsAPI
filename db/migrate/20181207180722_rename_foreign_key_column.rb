class RenameForeignKeyColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :wish_lists, :user_id, :created_by
  end
end
