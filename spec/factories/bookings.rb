FactoryGirl.define do
  factory :booking do
    start_at { Faker::Time.between(2.days, 4.days, :all) }
    end_at { Faker::Time.between(5.days, 7.days, :all) }
    client_email { Faker::Name.first_name+"@gmail.com" }
    price 0
    rental_id nil
  end
end
