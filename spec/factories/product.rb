FactoryBot.define do
  factory :product do
    name { Faker::StarWars.character }
    url { Faker::Internet.url }
    producer { Faker::LordOfTheRings.character }
    current_price { Faker::Number.number(100) }
  end
end
