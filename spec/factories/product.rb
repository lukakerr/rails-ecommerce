require 'faker'

FactoryBot.define do
  factory :product do |f|
    f.name { Faker::Name.name }
    f.description { Faker::Lorem.sentence }
    f.price 50.0
    f.old_price 100.0
    f.on_sale { Faker::Boolean.boolean(0.5) }
    f.sold_out { Faker::Boolean.boolean(0.5) }
    f.featured { Faker::Boolean.boolean(0.5) }
    f.quantity 10
    f.category_id { Faker::Number.between(1, 4) }
    f.user_id { Faker::Number.digit }
  end
end