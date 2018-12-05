# frozen_string_literal: true

class ChangePublicColumnAgainAgain < ActiveRecord::Migration[5.2]
  def change
    rename_column :wish_lists, :public_list?, :viewable
  end
end
