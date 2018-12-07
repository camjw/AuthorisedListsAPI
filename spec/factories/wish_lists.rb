# frozen_string_literal: true

FactoryBot.define do
  factory :wish_list do
    name { Faker::Lorem.word }
    viewable { Faker::Number.number(1) }
    created_by { Faker::Number.number(10) }
  end
end
