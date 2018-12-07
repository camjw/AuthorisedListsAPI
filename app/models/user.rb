# frozen_string_literal: true

# User record
class User < ApplicationRecord
  has_secure_password
  has_many :wish_lists, foreign_key: :created_by

  validates_presence_of :name, :email, :password_digest
end
