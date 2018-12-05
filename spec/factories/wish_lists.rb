FactoryBot.define do
  factory :wish_list do
    name { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
    public { false }
    user_id { nil }
  end
end
