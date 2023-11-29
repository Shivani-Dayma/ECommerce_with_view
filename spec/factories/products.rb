require 'faker'

FactoryBot.define do
    factory :product do
      association :user
      name { Faker::Commerce.product_name }
      description { Faker::Lorem.sentence }
      price { Faker::Commerce.price(range: 10.0..1000.0) }
      after(:build) do |product|
        product.product_image.attach(io: File.open('home/dell/Downloads/painting.jpg'), filename: 'painting.jpg', content_type: 'image/jpg')
      end
    end
  end

  