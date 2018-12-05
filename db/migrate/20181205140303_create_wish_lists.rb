# frozen_string_literal: true

# creates wishlist table
class CreateWishLists < ActiveRecord::Migration[5.2]
  def change
    create_table :wish_lists do |t|
      t.string :name
      t.boolean :public
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
