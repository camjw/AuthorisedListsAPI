# frozen_string_literal: true

# Wishlist record
class WishList < ApplicationRecord
  has_many :items
  belongs_to :user, optional: true

  validates_presence_of :name
end
