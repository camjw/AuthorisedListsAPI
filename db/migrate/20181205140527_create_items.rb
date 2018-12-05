# frozen_string_literal: true

# creates items table
class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :bought
      t.float :original_price
      t.float :price
      t.float :bid
      t.references :wish_list, foreign_key: true

      t.timestamps
    end
  end
end
