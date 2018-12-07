# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    password_digest { 'password' }
  end
end
