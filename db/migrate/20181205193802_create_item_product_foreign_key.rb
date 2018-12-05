class CreateItemProductForeignKey < ActiveRecord::Migration[5.2]
  def change
    create_table :item_product_foreign_keys do |t|
      add_foreign_key :items, :products
    end
  end
end
