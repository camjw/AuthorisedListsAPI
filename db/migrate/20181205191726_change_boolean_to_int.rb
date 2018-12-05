# frozen_string_literal: true

class ChangeBooleanToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :wish_lists, :viewable, 'integer USING CAST(viewable AS integer)'
  end
end
