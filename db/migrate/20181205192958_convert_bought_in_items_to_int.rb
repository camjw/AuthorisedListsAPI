class ConvertBoughtInItemsToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :bought, 'integer USING CAST(bought AS integer)'
  end
end
