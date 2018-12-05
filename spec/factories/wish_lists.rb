# frozen_string_literal: true

FactoryBot.define do
  factory :wish_list do
    name { Faker::Lorem.word }
    user_id { nil }

    public { false }
  end
end
