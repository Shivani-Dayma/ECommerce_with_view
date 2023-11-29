require 'faker'

FactoryBot.define do
  factory :user do
    # sequence(:id) { |n| "id#{n}" }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    address { Faker::Address.full_address }
    contactno { Faker::PhoneNumber.phone_number }
    role { rand(0..1) }
    token { Faker::Alphanumeric.alphanumeric(number: 20) }
  end
end

