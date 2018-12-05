# frozen_string_literal: true

# User record
class User < ApplicationRecord
  has_many :wish_lists
end
