require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password "password"
    f.password_confirmation "password"
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.billing_address { Faker::Address.street_address }
    f.billing_suburb { Faker::Address.city }
    f.billing_zip 2095
    f.billing_state "NSW"
    f.phone "0432 323 102"
    f.admin { Faker::Boolean.boolean(0.5) }
    f.shipping_address { Faker::Address.street_address }
    f.shipping_suburb { Faker::Address.city }
    f.shipping_zip 2095
    f.shipping_state "NSW"
  end
end