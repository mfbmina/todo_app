FactoryGirl.define do
  factory :todo_list do
    name { Faker::Lorem.sentence }
    user
  end
end
