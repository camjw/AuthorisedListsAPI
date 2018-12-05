# frozen_string_literal: true

class CreateItemProductForeignKey < ActiveRecord::Migration[5.2]
  def change
    create_table :item_product_foreign_keys do |_t|
      add_foreign_key :items, :products
    end
  end
end
