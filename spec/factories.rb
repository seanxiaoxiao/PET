# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :lifecycle do
    name "A lifecycle"
    description "A lifecycle description"
  end

  factory :project do
    sequence(:name) { Faker::Company.catch_phrase }
    sequence(:description) { Faker::Lorem.paragraph }
    lifecycle
  end

end
