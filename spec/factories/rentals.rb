FactoryGirl.define do
  factory :rental do
    name { Faker::Lorem.word }
    daily_rate { Faker::Number.decimal(2) }
  end
end
