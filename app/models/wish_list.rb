# frozen_string_literal: true

# Wishlist record
class WishList < ApplicationRecord
  has_many :items
  validates_presence_of :name, :viewable
end
