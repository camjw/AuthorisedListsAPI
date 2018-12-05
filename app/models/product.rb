# frozen_string_literal: true

# Item record
class Product < ApplicationRecord
  has_many :items
  validates_presence_of :name, :url, :producer, :current_price
end
