# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lifecycle do
    name "Waterfall"
    sequence(:description) { Faker::Lorem.paragraph }
  end
end
