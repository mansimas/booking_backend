FactoryGirl.define do
  factory :rental do
    name { Faker::Name.first_name }
    daily_rate { Faker::Number.decimal(2) }
  end
end
