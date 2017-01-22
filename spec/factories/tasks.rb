FactoryGirl.define do
  factory :task do
    description { Faker::Lorem.sentence }
    todo_list
  end
end
