FactoryBot.define do
  factory :wish_list do
    name { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
    public { false }
    user_id nil
  end
end

t.string 'name'
t.boolean 'public'
t.bigint 'user_id'
t.datetime 'created_at', null: false
t.datetime 'updated_at', null: false
t.index ['user_id'], name: 'index_wish_lists_on_user_id'
