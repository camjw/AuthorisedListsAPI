FactoryBot.define do
  factory :item do
    name { Faker::StarWars.character }
    bought { false }
    wish_list_id { nil }
    original_price { Faker::Number.number(100) }
    bid { Faker::Number.number(100) }
    product_id { nil }
  end
end
