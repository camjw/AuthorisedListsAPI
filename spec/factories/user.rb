# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
