class RemovePriceColumnFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :price
  end
end
