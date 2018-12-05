# frozen_string_literal: true

# User record
class User < ApplicationRecord
  has_many :wish_lists

  validates_presence_of :name, :email
end
