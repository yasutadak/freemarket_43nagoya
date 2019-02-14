FactoryGirl.define do
  factory :product do
    name               Faker::Pokemon.name
    status             "new_item"
    shipping_method    "merukari"
    region             Faker::Address.state
    shipping_timetable "first_days"
    description        Faker::Lorem.sentence
    price              "3000"
    shipping_burden    "exhibitor_burden"
    association :seller, factory: :user
  end
end
