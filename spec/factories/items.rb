FactoryBot.define do
  factory :item do
    title                       { Faker::Commerce.product_name }
    description                 { Faker::Lorem.paragraph }
    category_id                 { Category.ids.sample + 1 }
    condition_id                { Condition.ids.sample + 1 }
    charge_id                   { Charge.ids.sample + 1 }
    prefecture_id               { Prefecture.ids.sample + 1 }
    day_id                      { Day.ids.sample + 1 }
    price { Faker::Commerce.price(range: 300.0..1000.0) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end
  end
end

