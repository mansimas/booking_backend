FactoryGirl.define do
  factory :booking do
    start_at { Faker::Time.forward(2, :morning) }
    end_at { Faker::Time.forward(7, :morning) }
    client_email { Faker::Name.first_name+"@gmail.com" }
    price 0
    rental_id nil
  end
end
