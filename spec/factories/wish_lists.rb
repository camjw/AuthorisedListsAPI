FactoryBot.define do
  factory :wish_list do
    name { Faker::Lorem.word }
    user_id { Faker::Number.number(10) }
    public { false }
  end
end
