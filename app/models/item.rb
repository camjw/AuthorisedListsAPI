# frozen_string_literal: true

# Item record
class Item < ApplicationRecord
  belongs_to :wish_list
end
