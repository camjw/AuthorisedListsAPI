# frozen_string_literal: true

# Wishlist record
class WishList < ApplicationRecord
  has_many :items
  belongs_to :user, foreign_key: :created_by

  validates_presence_of :name, :viewable
end
